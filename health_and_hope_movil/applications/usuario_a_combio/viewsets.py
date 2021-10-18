from rest_framework import viewsets
from . import serializers
from . import models
from . import permissions

class TipoAnalisisMedViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAdminOrReadOnly]
    serializer_class = serializers.TipoAnalisisMedSerializer
    queryset = models.TipoAnalisisMed.objects.all()


class UsuarioACambioViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAdminOrReadOnly]
    serializer_class = serializers.UsuarioACambioSerializer
    queryset = models.UsuarioACambio.objects.all()


class InfoAnalisisMedUsuarioViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAdminOrReadOnly]
    serializer_class = serializers.InfoAnalisisMedUsuarioSerializer
    queryset = models.InfoAnalisisMedUsuario.objects.all()

