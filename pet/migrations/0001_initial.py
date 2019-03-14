# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-14 15:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('u_tel', models.CharField(max_length=11)),
                ('u_name', models.CharField(max_length=40, unique=True)),
                ('u_password', models.CharField(max_length=256)),
                ('token', models.CharField(max_length=256)),
            ],
        ),
    ]
