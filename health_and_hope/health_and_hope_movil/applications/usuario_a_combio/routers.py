from rest_framework.routers import DefaultRouter
# 
from . import viewsets
# 
router = DefaultRouter()

router.register(r'tipoAnalisisMedico', viewsets.TipoAnalisisMedViewSet, basename='tipoAnalisisMedico')
router.register(r'usuarioACambio', viewsets.UsuarioACambioViewSet, basename='usuarioACambio')
router.register(r'infoAnalisisMedUsuario', viewsets.InfoAnalisisMedUsuarioViewSet, basename='infoAnalisisMedUsuario')

urlpatterns = router.get_urls()