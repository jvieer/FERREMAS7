# Generated by Django 3.1.2 on 2024-05-26 17:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0012_compraitem_producto'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='compraitem',
            name='producto',
        ),
        migrations.AddField(
            model_name='compra',
            name='producto',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='core.producto'),
        ),
        migrations.AddField(
            model_name='compra',
            name='total',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=10),
        ),
    ]