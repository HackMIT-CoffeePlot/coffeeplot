# serializers.py
from rest_framework import serializers
from django.contrib.auth import get_user_model

User = get_user_model()

class RegisterUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'account_type')
        extra_kwargs = {'password': {'write_only': True}}
    
    def create(self, validated_data):
        user = User.objects.create_user(
            validated_data['username'], 
            email = validated_data['email'], 
            password = validated_data['password'], 
            account_type = validated_data['account_type'])
        return user


    def to_representation(self, instance):
        data = super().to_representation(instance)
        data['account_type'] = instance.account_type.value  # Use the enum value for representation
        return data
