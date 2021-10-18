from rest_framework.routers import DefaultRouter
# 
from . import viewsets
# 
router = DefaultRouter()

router.register(r'staff', viewsets.StaffViewSet, basename='staff')

urlpatterns = router.get_urls()