from django.db import models
from django.contrib.auth.models import AbstractUser
from enum import Enum, auto

class AccountType(Enum):
    PERSONAL_USER  = 'Personal User'
    BUSINESS_USER = 'Business User'

# Create your models here.
class User(AbstractUser):
    account_type = models.CharField(max_length=50, choices=[(tag, tag.value) for tag in AccountType])
