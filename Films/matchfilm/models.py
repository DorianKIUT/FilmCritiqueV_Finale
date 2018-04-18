# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from datetime import datetime


class Acteurs(models.Model):
    id_film = models.ForeignKey('Films', models.DO_NOTHING, db_column='id_film')
    name = models.CharField(max_length=255, blank=True, null=True)
    note = models.IntegerField(null=True)
    review = models.TextField(blank=True, null=True)
    date_review = models.DateTimeField(default=datetime.now, blank=True)
    username = models.CharField(max_length=255, null=True)

    class Meta:
        managed = False
        db_table = 'acteurs'


class Films(models.Model):
    name = models.CharField(max_length=50, blank=True, null=True)
    realisateur = models.CharField(max_length=50, blank=True, null=True)
    genre = models.CharField(max_length=50, blank=True, null=True)
    actors = models.TextField(blank=True, null=True)
    img = models.CharField(max_length=600, blank=True, default='https://image.freepik.com/icones-gratuites/bande-de-'
                                                               'film-arrondi-carre_318-34085.jpg')
    note_film = models.FloatField(blank=True, null=True)
    trailer = models.CharField(max_length=600, blank=True, null=True)
    resume = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'films'


class Note(models.Model):
    id_film = models.ForeignKey(Films, models.DO_NOTHING, db_column='id_film')
    note = models.IntegerField()
    review = models.TextField(blank=True, null=True)
    date_review = models.DateTimeField(default=datetime.now, blank=True)
    username = models.CharField(max_length=255, null=True)

    class Meta:
        managed = False
        db_table = 'note'


class Review(models.Model):
    id_film = models.ForeignKey(Films, models.DO_NOTHING, db_column='id_film')
    critique = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'review'


class TempDi(models.Model):
    id_film = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'temp_di'


class TempActor(models.Model):
    actor_name = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'temp_actor'


class Users(models.Model):
    username = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    mail = models.CharField(max_length=255)
    photo = models.CharField(max_length=600, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'


class TempUser(models.Model):
    id_user = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'temp_user'


class FilmsFavorite(models.Model):
    id_user = models.ForeignKey('Users', models.DO_NOTHING, db_column='id_user')
    id_film = models.ForeignKey(Films, models.DO_NOTHING, db_column='id_film')

    class Meta:
        managed = False
        db_table = 'films_favorite'
