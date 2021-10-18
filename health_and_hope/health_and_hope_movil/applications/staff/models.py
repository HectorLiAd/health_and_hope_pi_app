from abc import abstractclassmethod
from django.db import models

from applications.user.models import User
from model_utils.models import TimeStampedModel, UUIDModel
# Create your models here.

class Staff(TimeStampedModel, UUIDModel):
    nombre = models.CharField(max_length=150)
    usuario = models.ManyToManyField(User, blank=True)

    class Meta:
        verbose_name = 'Staff'
        verbose_name_plural = 'Staffs'

