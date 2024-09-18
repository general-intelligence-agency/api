import json
import os
from fastapi import FastAPI, HTTPException, Depends, Security, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from pydantic import BaseModel
from prisma import Prisma
from dotenv import load_dotenv
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

load_dotenv() 

app = FastAPI()

security = HTTPBearer()

VALID_API_KEY = os.getenv("VALID_API_KEY") 

origins = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class FormData(BaseModel):
    firmName: str
    websiteUrl: str
    registrationNumber: str
    barAssociationNumber: str
    jurisdiction: str
    ownerFirstName: str
    ownerLastName: str
    ownershipPercentage: float
    firstName: str
    lastName: str
    email: str
    phoneNumber: str

async def get_api_key(credentials: HTTPAuthorizationCredentials = Security(security)):
    if credentials.credentials != VALID_API_KEY:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN, detail="Invalid API Key"
        )
    return credentials.credentials

@app.post("/api/v1/applications")
async def handle_new_application(
    form_data: FormData, 
    api_key: str = Depends(get_api_key)
):
    print("api key ", api_key)
    prisma = Prisma()
    await prisma.connect()

    try:
        async with prisma.tx() as tx:
            entity = await tx.entity.create(
                data={
                    "name": form_data.firmName,
                    "website": form_data.websiteUrl,
                    "custom_fields": json.dumps({
                        "registrationNumber": form_data.registrationNumber,
                        "barAssociationNumber": form_data.barAssociationNumber,
                        "jurisdiction": form_data.jurisdiction,
                    }),
                    "owner_first_name": form_data.ownerFirstName,
                    "owner_last_name": form_data.ownerLastName,
                    "ownership_percentage": form_data.ownershipPercentage,
                }
            )

            application = await tx.application.create(
                data={
                    "first_name": form_data.firstName,
                    "last_name": form_data.lastName,
                    "email": form_data.email,
                    "phone_number": form_data.phoneNumber,
                    "entity_id": entity.id,
                }
            )

        print("Form submitted:", {"entity": entity, "application": application})
        return {"message": "Onboarding successful"}

    except Exception as error:
        print("Error submitting form:", error)
        raise HTTPException(status_code=500, detail="Internal Server Error")

    finally:
        await prisma.disconnect()
