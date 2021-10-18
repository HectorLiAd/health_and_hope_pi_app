from rest_framework import serializers
# 
from . import models


class UserRegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        fields = [
            # 'id', 
            'email',
            'first_name', 
            'last_name', 
            'username', 
            'password', 
            # 'avatar'
        ]
    
    # Procesos para encriptar la contraseña
    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        
        instance.save()
        return instance


class UserSerializer(serializers.ModelSerializer):
    # avatar = serializers.ImageField(max_length=None, use_url=True, allow_null=True, required=False)
    class Meta:
        model = models.User
        fields = [
            'id', 
            'username', 
            'first_name', 
            'last_name', 
            'email', 
            'avatar',
            'informacion',
            'created'
        ]
    


class UserUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.User
        fields = [
            'first_name', 
            'last_name', 
            'username', 
            'informacion'
        ]