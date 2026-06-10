from pydantic_settings import BaseSettings
from pydantic.types import Any

class Settings(BaseSettings):
    check_expiration: bool = True
    jwt_header_prefix: str = "Bearer"
    jwt_header_name: str = "Authorization"
    userpools: dict[str, dict[str, Any]] = {
        "eu": {
            "region": "eu-west-2",
            "userpool_id": "eu-west-2_Yuoowbbup",
            "app_client_id": ["7sjf4vgvcp30kafm09gekjpkov"]
        }
    }

settings = Settings()