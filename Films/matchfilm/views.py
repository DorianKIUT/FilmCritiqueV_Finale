# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import json
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from matchfilm.models import Films, TempDi, Note, Acteurs, TempActor, Users, TempUser, FilmsFavorite
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Min, Sum, Count, Max, Avg
# Create your views here.


def matchfilm(request):
    return render(request, 'matchfilm/matchfilm.html', locals())


def filminfo(request):
    return render(request, 'matchfilm/film.html', locals())


def listfilm(request):
    return render(request, 'matchfilm/listfilm.html', locals())


def listactor(request):
    return render(request, 'matchfilm/listactor.html', locals())


def filmactor(request):
    return render(request, 'matchfilm/actor.html', locals())


def userpage(request):
    return render(request, 'matchfilm/user.html', locals())


@csrf_exempt
def filmpage(request):
    post_data = json.loads(request.body)
    film = post_data['film_info']
    id_film = film['id']
    TempDi.objects.update(id_film=id_film)
    return HttpResponse(True)


def actorpage(request):
    post_data = json.loads(request.body)
    actor = post_data['actor_info']
    TempActor.objects.update(actor_name=str(actor))
    return HttpResponse(True)


def getpageactor(request):
    name_actor = ''
    actor_selected = TempActor.objects.all().values('actor_name')
    for actor in actor_selected:
        name_actor = actor['actor_name']
    all_films_actor_selected = get_all_film_actor_selected(name_actor)
    sum_globale, count_globale, note_globale = get_note_actor_selected(name_actor)
    list_all_notes = get_percentage_all_note(name_actor)

    return JsonResponse({'name_actor': name_actor,
                         'all_films_actor_selected': all_films_actor_selected,
                         'sum_globale': sum_globale,
                         'count_globale': count_globale,
                         'note_globale': note_globale,
                         'list_all_notes': list_all_notes})


def getpagefilm(request):
    id_selected = 0
    id_film = TempDi.objects.all().values('id_film')
    for idf in id_film:
        id_selected = idf['id_film']
    # récupération de toute les critiques positives et négatives ( acteurs et films ) pour le film selectionné
    review_film_positive, review_film_negative = get_note_and_review_film(id_selected)
    review_actor_positive, review_actor_negative = get_note_and_review_acteur(id_selected)
    film_selected = Films.objects.filter(id=id_selected).values('id', 'name', 'realisateur', 'genre', 'actors', 'img',
                                                                'trailer', 'resume')
    sum_note_film_selected = get_sum_note_film(id_selected)
    count_note_film_selected = get_count_note_film(id_selected)
    moyenne_note_film_selected = get_average_note_film(sum_note_film_selected, count_note_film_selected)
    list_notes_actors = get_actors_review_and_note_film_selected(id_selected)

    return JsonResponse({'films': list(film_selected),
                         'moyenne': moyenne_note_film_selected,
                         'nb_note': count_note_film_selected,
                         'sum_note': sum_note_film_selected,
                         'actors': list_notes_actors,
                         'all_review_positive': list(review_film_positive),
                         'all_review_negative': list(review_film_negative),
                         'all_review_acteur_positive': list(review_actor_positive),
                         'all_review_acteur_negative': list(review_actor_negative)}, safe=False)


def get_note_and_review_film(id_selected):
    review_film_positive = Note.objects.filter(id_film=id_selected, note__gte=2.5).values('id', 'id_film', 'note',
                                                                                           'review','date_review', 'username').order_by('-id')
    review_film_negative = Note.objects.filter(id_film=id_selected, note__lt=2.5).values('id', 'id_film', 'note',
                                                                                          'review','date_review', 'username').order_by('-id')
    return review_film_positive, review_film_negative


def get_note_and_review_acteur(id_selected):
    review_actor_positive = Acteurs.objects.filter(id_film=id_selected, note__gte=2.5).values('id', 'id_film', 'note',
                                                                                               'review', 'name', 'username').order_by('-id')
    review_actor_negative = Acteurs.objects.filter(id_film=id_selected, note__lt=2.5).values('id', 'id_film', 'note',
                                                                                              'review', 'name','date_review', 'username').order_by('-id')
    return review_actor_positive, review_actor_negative,


def get_sum_note_film(id_selected):
    sum_note = Note.objects.filter(id_film=id_selected).values('note').aggregate(Sum('note'))
    for value in sum_note.values():
        sum_note = value
    return sum_note


def get_actors_review_and_note_film_selected(id_selected):
    list_note_actor = list()
    list_actors = list()
    distinct_actor = Acteurs.objects.filter(id_film=id_selected).values('name').distinct()

    for actor in distinct_actor:
        list_actors.append(actor['name'])
    for actor in list_actors:
        dic_note_actor = dict()
        dic_note_actor['name'] = actor
        sum_note_actor = Acteurs.objects.filter(id_film=id_selected, name=actor).values('note').aggregate(Sum('note'))
        count_note_actor = Acteurs.objects.filter(id_film=id_selected, name=actor).values('note').aggregate(
            Count('note'))
        for value in sum_note_actor.values():
            sum_note_actor = value
            if sum is not None:
                dic_note_actor['sum'] = value
        for value in count_note_actor.values():
            count_note_actor = value
            if value is not None:
                dic_note_actor['count'] = value
            if count_note_actor != 0 and sum_note_actor != 0:
                moyenne_actor = round(float(sum_note_actor) / float(count_note_actor), 2)
            else:
                moyenne_actor = None
            dic_note_actor['note'] = moyenne_actor
            dic_note_actor['id_film'] = id_selected
        list_note_actor.append(dic_note_actor)
    return list_note_actor


def get_count_note_film(id_selected):
    count_note = Note.objects.filter(id_film=id_selected).values('note').aggregate(Count('note'))
    for value in count_note.values():
        count_note = value
    return count_note


def get_average_note_film(sum, count):
    moyenne = 0
    if count != 0 and sum != 0:
        moyenne = round(float(sum)/float(count), 2)
    return moyenne


def get_all_film_actor_selected(actor_name):
    films = Films.objects.filter(actors__contains=actor_name).values('id', 'name', 'realisateur', 'genre', 'actors',
                                                                     'img', 'note_film', 'resume').order_by('name')
    return list(films)


def get_note_actor_selected(actor_name):
    sum_global = Acteurs.objects.filter(name=actor_name).aggregate(Sum('note'))
    count_global = Acteurs.objects.filter(name=actor_name).aggregate(Count('note'))
    test_avg = Acteurs.objects.filter(name=actor_name).aggregate(Avg('note'))
    moyenne = test_avg['note__avg']
    return sum_global['note__sum'], count_global['note__count'], moyenne


def get_percentage_all_note(actor_name):
    list_note = list()
    all_note = ''
    for i in range(0, 6):
        dict_note = dict()
        all_note = Acteurs.objects.filter(name=actor_name, note=i).aggregate(Count('note'))
        dict_note['note'+str(i)+'/5'] = all_note['note__count']
        list_note.append(dict_note)
    return list_note

def getallfilms(request):
    note = 0
    all_films = Films.objects.all().values('id', 'name', 'realisateur', 'genre', 'actors', 'img', 'note_film', 'resume')\
        .order_by('name')
    for film in all_films:
        sum_by_film = Note.objects.filter(id_film=film['id']).values('note').aggregate(Sum('note'))
        count_by_film = Note.objects.filter(id_film=film['id']).values('note').aggregate(Count('note'))
        if sum_by_film['note__sum'] is not None:
            note = float(float(sum_by_film['note__sum']) / float(count_by_film['note__count']))
            Films.objects.filter(id=film['id']).update(note_film=note)
    return JsonResponse({'allfilms': list(all_films)}, safe=False)


def addfilm(request):
    string_actors = ''
    id_to_add = 0
    post_data = json.loads(request.body)
    film_to_add = post_data['film_data']
    newfilm = Films(name=film_to_add['name'], realisateur=film_to_add['realisateur'], genre=film_to_add['genre'],
                    actors=string_actors, img=film_to_add['img'])
    newfilm.save()
    max_id = Films.objects.all().values('id').aggregate(Max('id'))
    for value in max_id.values():
        id_to_add = value
    if len(film_to_add['actors']) > 1:
        for actors in film_to_add['actors']:
            newacteur = Acteurs(id_film_id=id_to_add, name=actors)
            newacteur.save()
            string_actors += actors + ','
    else:
        string_actors = film_to_add['actors'][0]
        newacteur = Acteurs(id_film_id=id_to_add, name=film_to_add['actors'][0])
        newacteur.save()
    Films.objects.filter(id=id_to_add).update(actors=string_actors)
    update_list_film = getupdatefilm()
    return JsonResponse({'update_list_film': list(update_list_film)}, safe=False)


def getupdatefilm():
    note = 0
    all_films = Films.objects.all().values('id', 'name', 'realisateur', 'genre', 'actors', 'img', 'note_film', 'resume')\
        .order_by('name')
    for film in all_films:
        if film['note_film'] is not None:
            sum_by_film = Note.objects.filter(id_film=film['id']).values('note').aggregate(Sum('note'))
            count_by_film = Note.objects.filter(id_film=film['id']).values('note').aggregate(Count('note'))
            if sum_by_film != 0 and count_by_film != 0:
                note = float(float(sum_by_film['note__sum']) / float(count_by_film['note__count']))
            Films.objects.filter(id=film['id']).update(note_film=note)
    return all_films


def addreview(request):
    post_data = json.loads(request.body)
    new_note = Note(id_film_id=post_data['id'], note=int(post_data['note']), review=post_data['review'], username=post_data['username'])
    new_note.save()
    review_positives = Note.objects.filter(id_film=post_data['id'], note__gte=2.5).values('id', 'id_film', 'note',
                                                                                      'review','date_review', 'username').order_by('-id')
    review_negatives = Note.objects.filter(id_film=post_data['id'], note__lt=2.5).values('id', 'id_film', 'note',
                                                                                     'review','date_review', 'username').order_by('-id')
    return JsonResponse({'all_review_positive': list(review_positives),
                         'all_review_negative': list(review_negatives)}, safe=False)


def addnoteactor(request):
    post_data = json.loads(request.body)
    new_note = post_data['note']
    new_review = post_data['review']
    actor = post_data['actor']
    username = post_data['username']
    new_entry = Acteurs(id_film_id=actor['id_film'], note=int(new_note), name=actor['name'],
                        review=new_review, username=username)
    new_entry.save()
    review_positives = Acteurs.objects.filter(id_film=actor['id_film'], note__gte=2.5).values('id', 'id_film', 'note',
                                                                                          'review', 'name','date_review', 'username').order_by('-id')
    review_negatives = Acteurs.objects.filter(id_film=actor['id_film'], note__lt=2.5).values('id', 'id_film', 'note',
                                                                                         'review', 'name','date_review', 'username').order_by('-id')
    return JsonResponse({'all_review_acteur_positive': list(review_positives),
                         'all_review_acteur_negative': list(review_negatives)}, safe=False)


def filmfilter(request):
    post_data = json.loads(request.body)
    filter_film = post_data['filter']
    film_filtered = select_film_with_filter(filter_film)
    return JsonResponse({'new_select': list(film_filtered)}, safe=False)


def select_film_with_filter(all_filter):
    if all_filter == 'note':
        all_filter = '-note_film'
    film_filtered = Films.objects.all().values('id', 'name', 'realisateur', 'genre', 'actors', 'img', 'note_film')\
        .order_by(all_filter)
    return film_filtered


def genrefilter(request):
    post_data = json.loads(request.body)
    genre_film = post_data['genre']
    if genre_film is not None:
        film_filtered = Films.objects.filter(genre=genre_film).values('id', 'name', 'realisateur', 'genre', 'actors',
                                                                      'img', 'note_film', 'resume').order_by('name')
    else:
        film_filtered = Films.objects.all().values('id', 'name', 'realisateur', 'genre', 'actors',
                                                   'img', 'note_film','date_review', 'resume').order_by('genre')
    return JsonResponse({'new_genre': list(film_filtered)}, safe=False)


def notefilter(request):
    filter_review_negative = list()
    filter_review_positive = list()
    post_data = json.loads(request.body)
    genre_data = post_data['data_filter']
    film_selected = post_data['film_selected']
    if type(genre_data) == list:
        filter_review = Note.objects.filter(id_film=film_selected, note__gte=genre_data[0], note__lte=genre_data[1])\
            .values('id', 'id_film', 'review', 'note').order_by('-id')
        for review in filter_review:
            if review['note'] < 2.5:
                filter_review_negative.append(review)
            else:
                filter_review_positive.append(review)
    elif type(genre_data) == unicode:
        filter_review = Acteurs.objects.filter(id_film=film_selected, name=genre_data) \
            .values('id', 'id_film', 'review', 'note', 'name','date_review').order_by('-id')
        for review in filter_review:
            if review['review'] is not None:
                if review['note'] < 2.5:
                    filter_review_negative.append(review)
                else:
                    filter_review_positive.append(review)
    else:
        print 'error'
    print 'REVIEW POSITIVE', filter_review_positive, '\n', 'REVIEW NEGATIVE', filter_review_negative
    print filter_review_positive, '\n', filter_review_negative
    return JsonResponse({'new_list_positive': list(filter_review_positive),
                         'new_list_negative': list(filter_review_negative)}, safe=False)


def getconnexion(request):
    post_data = json.loads(request.body)
    login = post_data['connexion_info']
    list_username = list()
    usernames = Users.objects.all().values('username')
    for username in usernames:
        list_username.append(username['username'])
    if login['username'] in list_username:
        ret = check_password(login)
        if ret == 0:
            write_temp_user(login['username'])
    else:
        ret = 1
    return JsonResponse({'message_ret': ret}, safe=False)


def check_password(username):
    ret = 1
    password = Users.objects.filter(username=username['username']).values('password')
    for pwd_check in password:
        pwd = pwd_check['password']
        if username['password'] == pwd:
            ret = 0
    return ret


def write_temp_user(username):
    temp_id = 0
    id_user = Users.objects.filter(username=username).values('id')
    for ids in id_user:
        temp_id = ids['id']
    new_temp_user = TempUser(id_user=temp_id)
    new_temp_user.save()


def deconnexion(request):
    del_temp_user = TempUser.objects.order_by('id')[0]
    TempUser.delete(del_temp_user)
    return HttpResponse(True)


def getconnexionactive(request):
    active = False
    username = ''
    user_temp = TempUser.objects.all().values('id_user')
    if len(user_temp) > 0:
        for user_id in user_temp:
            id_temp = user_id['id_user']
            user_info = Users.objects.filter(id=id_temp).values('id', 'username', 'password')
            for user_temp in user_info:
                username = user_temp['username']
        active = True
    return JsonResponse({'active_connexion': active, 'username': username}, safe=False)


def get_user_id_temp():
    id_temp = ''
    user_temp = TempUser.objects.all().values('id_user')
    for user_id in user_temp:
        id_temp = user_id['id_user']
    return id_temp


def get_user_name_temp():
    id_temp = get_user_id_temp()
    name_user = Users.objects.filter(id=id_temp).values('username')
    for username in name_user:
        name_user = username['username']
    return name_user


def get_user_film(id_user):
    film_id_by_user = list()
    film_favorite = FilmsFavorite.objects.filter(id_user=id_user).values('id_film')
    print film_favorite
    for film in film_favorite:
        film_id_by_user.append(film['id_film'])
    return film_id_by_user


def get_user_film_name(list_film_id_user):
    film_favorite_user = tuple()
    print list_film_id_user
    for film_id in list_film_id_user:
        film_favorite_user += tuple(Films.objects.filter(id=film_id).values('id', 'name', 'realisateur', 'genre', 'actors',  'img',
                                                            'note_film', 'resume').order_by('name'))
    return film_favorite_user


def addtofavorite(request):
    post_data = json.loads(request.body)
    id_film_to_add = post_data['film_to_add']
    id_temp = ''
    ret = 1
    new_film_favorite = ''
    user_temp = TempUser.objects.all().values('id_user')
    for user_id in user_temp:
        id_temp = user_id['id_user']
    curent_films_favorite = FilmsFavorite.objects.filter(id_user=id_temp).values('id_film')
    if len(curent_films_favorite) > 0:
        for id_film in curent_films_favorite:
            if id_film_to_add == id_film['id_film']:
                ret = 1
                delete_film_favorite = FilmsFavorite.objects.filter(id_user_id=id_temp, id_film_id=id_film_to_add)
                delete_film_favorite.delete()
            else:
                ret = 0
                new_film_favorite = FilmsFavorite(id_user_id=id_temp, id_film_id=id_film_to_add)
    else:
        ret = 0
        new_film_favorite = FilmsFavorite(id_user_id=id_temp, id_film_id=id_film_to_add)
        new_film_favorite.save()
    if ret == 0:
        new_film_favorite.save()
    return JsonResponse({'message_ret': ret}, safe=False)


def getallfilmsuser(request):
    id_temp = get_user_id_temp()
    film_user_id = get_user_film(id_temp)
    film_user_name = get_user_film_name(film_user_id)
    print film_user_name
    return JsonResponse({'all_film_user': list(film_user_name)}, safe=False)


def adduser(request):
    post_data = json.loads(request.body)
    new_user = post_data['new_user']
    all_users = Users.objects.all().values('username')
    list_users = list()
    for user in all_users:
        list_users.append(user['username'])
    print list_users
    if new_user['username'] not in list_users:
        ret = 0
        add_user = Users(username=new_user['username'], password=new_user['password'], mail=new_user['email'])
        add_user.save()
    else:
        ret = 1
    return JsonResponse({'message_ret': ret}, safe=False)


def get_count_user_film_review(username):
    print username
    nb_note = Note.objects.filter(username=username).aggregate(Count('note'))
    return nb_note['note__count']


def get_count_user_actor_review(username):
    print username
    nb_note = Acteurs.objects.filter(username=username).aggregate(Count('note'))
    return nb_note['note__count']


def getcountuserreview(request):
    username = get_user_name_temp()
    count_review_film = get_count_user_film_review(username)
    count_review_actor = get_count_user_actor_review(username)
    print count_review_actor, count_review_film
    return JsonResponse({'nb_actor_reviews': count_review_actor, 'nb_film_reviews': count_review_film}, safe=False)
