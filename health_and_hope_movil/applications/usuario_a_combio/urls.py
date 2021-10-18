from django.urls import path, include

urlpatterns = [
    path(
        '',
        include('applications.usuario_a_combio.routers'),
    ),
]