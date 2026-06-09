from fastapi import FastAPI
from fastapi import Depends
from fastapi_cognito import CognitoToken
from settings import settings
from fastapi_cognito import CognitoAuth, CognitoSettings

cognito_eu = CognitoAuth(
  settings=CognitoSettings.from_global_settings(settings)
)

app = FastAPI()

@app.get("/")
async def root(auth: CognitoToken = Depends(cognito_eu.auth_required)):
    return {"message": "Hello World"}