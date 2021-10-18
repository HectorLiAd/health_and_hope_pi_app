from rest_framework import viewsets
from rest_framework.permissions import (
    IsAuthenticated, # Si esta autenticado
    IsAdminUser, # Si es administrador
    AllowAny, # Para cualquier usuario 
)
# 
from . import serializers
from . import models
from . import permissions

class StaffViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAdminOrReadOnly]
    # authentication_classes = (TokenAuthentication,)
    serializer_class = serializers.StaffSerializer
    def get_queryset(self):
        return models.Staff.objects.all()
