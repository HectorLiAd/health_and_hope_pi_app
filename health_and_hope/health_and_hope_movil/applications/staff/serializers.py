from rest_framework import serializers, pagination
# from drf_extra_fields.fields import HybridImageField
# 
from . import models

class StaffSerializer(serializers.ModelSerializer):
    class Meta():
        model = models.Staff
        fields = ('__all__')