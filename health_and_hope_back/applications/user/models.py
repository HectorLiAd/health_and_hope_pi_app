from django.db import models
from django.contrib.auth.models import AbstractUser
from model_utils.models import TimeStampedModel, UUIDModel
import os
# Create your models here.

class Rol(UUIDModel, TimeStampedModel):
    nombre = models.CharField('Nombre', max_length=150, unique=True)
    class Meta:
        verbose_name = 'Rol de usuario'
        verbose_name_plural = 'Roles de usuario'
    def __str__(self):
        return f'{self.nombre}'

class User(AbstractUser, UUIDModel, TimeStampedModel):
    email = models.CharField('E-mail',max_length=150, unique=True)
    avatar = models.ImageField(upload_to="images", null=True)
    informacion = models.TextField()
    rol = models.ManyToManyField(Rol)

    def delete(self, *args, **kwargs):
        if os.path.isfile(self.avatar.path):
            os.remove(self.avatar.path)
        super(User, self).delete(*args, **kwargs)

    def save(self, *args, **kwargs):
        try:
            obj = User.objects.get(id=self.id)
            if obj.avatar != self.avatar:
                if os.path.isfile(obj.avatar.path):
                    os.remove(obj.avatar.path)
        except: pass
        super(User, self).save(*args, **kwargs)

    # comentar esto para poder registrar superusers
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def __str__(self):
        return f'{self.email}'

