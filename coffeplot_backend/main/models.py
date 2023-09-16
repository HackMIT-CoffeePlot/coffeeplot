from django.db import models
from django.contrib.auth.models import AbstractUser
from enum import Enum, auto

# Create your models here.
class User(AbstractUser):
    PERSONAL_USER  = 'Personal User'
    BUSINESS_USER = 'Business User'

    ACCOUNT_CHOICES = [
        (PERSONAL_USER, 'Personal User'),
        (BUSINESS_USER, 'Business User'),
    ]
    
    account_type = models.CharField(max_length=50, choices=ACCOUNT_CHOICES, default=PERSONAL_USER)

    def __str__(self):  
        return self.username

# Location Model
class Location(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    address = models.CharField(max_length=100)

# Compost Types: Coffe Ground, Yard Waste, Food Waste, and Other
class CompostType(Enum):
    COFFEE_GROUND = 'Coffee Ground'
    YARD_WASTE = 'Yard Waste'
    FOOD_WASTE = 'Food Waste'
    OTHER = 'Other'

    COMPOST_CHOICES = [
        (COFFEE_GROUND, 'Coffee Ground'),
        (YARD_WASTE, 'Yard Waste'),
        (FOOD_WASTE, 'Food Waste'),
        (OTHER, 'Other'),
    ]

    compost_choices = models.CharField(max_length=50, choices=COMPOST_CHOICES, default=COFFEE_GROUND)
    in_stock = models.BooleanField(default=False)
    business_user = models.ForeignKey(User, on_delete=models.CASCADE)
    location = models.ForeignKey(Location, on_delete=models.CASCADE)
    description = models.TextField()
    quantity = models.IntegerField(default=0)
    donated_freq = models.IntegerField(default=0)

class Compost(models.Model):
    compost_type = models.CharField(max_length=50, choices=[(tag, tag.value) for tag in CompostType])

