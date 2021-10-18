from rest_framework import serializers, pagination
# from drf_extra_fields.fields import HybridImageField
# 
from . import models

class UsuarioACambioSerializer(serializers.ModelSerializer):
    class Meta():
        model = models.UsuarioACambio
        fields = ('__all__')


class TipoAnalisisMedSerializer(serializers.ModelSerializer):
    class Meta():
        model = models.TipoAnalisisMed
        fields = ('__all__')


class InfoAnalisisMedUsuarioSerializer(serializers.ModelSerializer):
    class Meta():
        model = models.InfoAnalisisMedUsuario
        fields = ('__all__')
