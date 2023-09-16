from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User

# Register your models here.
class CustomUserAdmin(UserAdmin):
    # Add account_type to the fieldsets to make it editable in admin
    fieldsets = UserAdmin.fieldsets + (
            (None, {'fields': ('account_type',)}),
    )
    # Also add account_type to the list of displayed fields in the list view
    list_display = ['username', 'email', 'account_type', 'is_staff']

admin.site.register(User, CustomUserAdmin)
