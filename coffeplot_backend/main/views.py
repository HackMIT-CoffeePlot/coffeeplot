from django.shortcuts import render
from django.contrib.auth import authenticate
from rest_framework import generics, permissions
from rest_framework.response import Response
from knox.models import AuthToken
from .serializers import RegisterUserSerializer
# Create your views here.

class LoginAPI(generics.GenericAPIView):
    serializer_class = RegisterUserSerializer

    def post(self, request, *args, **kwargs):
        user = authenticate(username = request.data['username'], password = request.data['password'])
        if user is not None:
            _, token = AuthToken.objects.create(user)
            return Response({
                "user": RegisterUserSerializer(user, context=self.get_serializer_context()).data,
                "token": token
            })
        else:
            return Response({"error": "Invalid credentials"}, status=400)
        
class SignupAPI(generics.GenericAPIView):
    serializer_class = RegisterUserSerializer

    def post(self, request, *args, **kwargs):
        print(request.data)
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        _, token = AuthToken.objects.create(user)
        return Response({
            "user": RegisterUserSerializer(user, context=self.get_serializer_context()).data,
            "token": token
        })

