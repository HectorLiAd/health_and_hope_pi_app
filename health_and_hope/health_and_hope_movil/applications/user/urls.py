from django.urls import path

# JWT
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from . import viewsets

urlpatterns = [
    path('auth/login/', TokenObtainPairView.as_view(), name='acces_token'),
    path('auth/token/refresh/', TokenRefreshView.as_view(), name='refresh_token'),
    path('auth/register/', viewsets.RegisterUser.as_view()),
    path('auth/me/', viewsets.UserView.as_view(), name=''),
]