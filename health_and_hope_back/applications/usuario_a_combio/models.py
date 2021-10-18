from django.db import models
from applications.user.models import User
from model_utils.models import TimeStampedModel, UUIDModel

# Create your models here.
class UsuarioACambio(TimeStampedModel, UUIDModel):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE)
    
    class Meta:
        verbose_name = 'Usuario a cambio (Manita Azul)'
        verbose_name_plural = 'Usuarios a cambio (Manita Azul)'

    def __str__(self):
        return f'{self.usuario.email}'


class TipoAnalisisMed(UUIDModel):
    nombre = models.CharField("Nombre del tipo de analisis medico",max_length=150)
    
    class Meta:
        verbose_name = 'Tipo de analisis clinico o medico'
        verbose_name_plural = 'Tipos de nalisis clinico o medico'
    
    def __str__(self):
        return f'{self.nombre}'

class InfoAnalisisMedUsuario(TimeStampedModel, UUIDModel):
    tipoAnalisisMed = models.ForeignKey(TipoAnalisisMed, on_delete=models.CASCADE, blank=True, null=True)
    usuarioACambio = models.ForeignKey(UsuarioACambio,on_delete=models.CASCADE, blank=True, null=True)
    archivo = models.FileField(upload_to='infoAnalisisMedUsuario')

    class Meta:
        verbose_name = 'Analisis medico del usuario (Manita azul)'
        verbose_name_plural = 'Analisis medicos de los usuarios (Manita azul)'

    def __str__(self):
        return f'{self.id}'
   