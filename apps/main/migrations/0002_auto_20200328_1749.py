# Generated by Django 3.0.4 on 2020-03-28 17:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='establishment',
            name='name',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='name',
            field=models.CharField(max_length=300, null=True),
        ),
        migrations.AlterField(
            model_name='event',
            name='band',
            field=models.ManyToManyField(blank=True, null=True, related_name='events', to='main.Band'),
        ),
    ]
