# urls.py
from django.urls import path
from .views import SignupAPI, LoginAPI, AccountTypeAPI

urlpatterns = [
    path('signup/', SignupAPI.as_view()),
    path('login/', LoginAPI.as_view()),
    path('accounttype/', AccountTypeAPI.as_view()),
]