from fastapi import Depends, APIRouter
from fastapi_cognito import CognitoToken
from fastapi_cognito import CognitoAuth, CognitoSettings
from settings import settings

router = APIRouter()

cognito_eu = CognitoAuth(
  settings=CognitoSettings.from_global_settings(settings)
)

@router.get("/health")
async def health():
    return {"status": "ok"}

@router.get("/")
async def root(auth: CognitoToken = Depends(cognito_eu.auth_required)):
    return {"message": "Hello World"}