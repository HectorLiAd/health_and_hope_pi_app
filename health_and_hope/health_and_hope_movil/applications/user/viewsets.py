from rest_framework import schemas
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
# 
from drf_yasg.utils import swagger_auto_schema
# 
from . import serializers
from . import models
# 

# only the GET method will be shown in Swagger
# @api_view(['GET', 'PUT'])
class RegisterUser(APIView):
    
    models = models.User

    @swagger_auto_schema(responses={200: serializers.UserRegisterSerializer()})
    def post(self, request):
        serializer_data = serializers.UserRegisterSerializer(data=request.data)
        if serializer_data.is_valid(raise_exception=True):
            serializer_data.save() #para guardar el dato
            return Response(serializer_data.data)
        return Response(
            status= status.HTTP_400_BAD_REQUEST,
            data = serializer_data.errors
        )


class UserView(APIView):
    permission_classes = [IsAuthenticated,]

    @swagger_auto_schema(responses={200: serializers.UserSerializer()})
    
    def get(self, request):
        serializers_data = serializers.UserSerializer(request.user, context={"request":request})
        return  Response(serializers_data.data)

    # Acutlizar usuario
    @swagger_auto_schema(responses={200: serializers.UserUpdateSerializer()})
    def put(self, request):
        user = models.User.objects.get(id = request.user.id)
        serializer_data = serializers.UserUpdateSerializer(user, request.data)
        if serializer_data.is_valid(raise_exception=True):
            serializer_data.save()
            return Response(serializer_data.data)
        return Response(status= status.HTTP_400_BAD_REQUEST, data=serializer_data.errors)