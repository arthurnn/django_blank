from django.conf.urls.defaults import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'album_book.views.home', name='home'),
    # url(r'^album_book/', include('album_book.foo.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
