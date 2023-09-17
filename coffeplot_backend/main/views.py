from django.contrib.auth import authenticate
from rest_framework import generics, permissions
from rest_framework.response import Response
from rest_framework.authtoken.models import Token  # <-- Import the Token model from DRF
from .serializers import RegisterUserSerializer

class LoginAPI(generics.GenericAPIView):
    permission_classes = (permissions.AllowAny, )
    serializer_class = RegisterUserSerializer

    def post(self, request, *args, **kwargs):
        print
        user = authenticate(username=request.data['username'], password=request.data['password'])
        if user is not None:
            token, created = Token.objects.get_or_create(user=user)  # <-- Use DRF's Token model
            return Response({
                "user": RegisterUserSerializer(user, context=self.get_serializer_context()).data,
                "token": token.key
            })
        else:
            return Response({"error": "Invalid credentials"}, status=400)

class SignupAPI(generics.GenericAPIView):
    permission_classes = (permissions.AllowAny, )
    serializer_class = RegisterUserSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        token, created = Token.objects.get_or_create(user=user)  # <-- Use DRF's Token model
        return Response({
            "user": RegisterUserSerializer(user, context=self.get_serializer_context()).data,
            "token": token.key
        })

class AccountTypeAPI(generics.GenericAPIView):
    serializer_class = RegisterUserSerializer
    permission_classes = (permissions.IsAuthenticated, )

    def get(self, request, *args, **kwargs):
        print(request.data)
        user = request.user
        print(user)
        if user.is_authenticated:
            return Response({
                "account_type": user.account_type
            })
        else:
            return Response({"detail": "Not authenticated."}, status=401)