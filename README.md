![](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)

## Drag & drop une image avec Swift

Avec Swift et Cocoa, le pouvoir dont on dispose en seulement quelques lignes de code est impressionant.

Un mécanisme typique d'OS X est le "drag & drop" ("glisser/déposer")&nbsp;: avec la souris ou le trackpad, on attrape un fichier image à partir du Finder et on le dépose sur la fenêtre d'une application, et l'image apparaît instantanément dans l'application, donnant à l'utilisateur la sensation d'avoir effectué un geste naturel.

Nous allons créer en quelques minutes une micro application pour démontrer ce principe.

### Le principe

Il faut décider quelle zone de l'application sera réceptive au glisser-déposer. 

Dans notre cas, ce sera la partie haute d'une fenêtre divisée en deux parties (nous ferons apparaître du texte dans la partie basse).

Cette partie de la fenêtre sera une "ImageView" que nous allons nommer `DemoImageView` dans ce tutoriel.

*[Lire la suite dans l'article de blog sur aya.io](http://aya.io/blog/glisser-deposer-une-image-avec-swift/)*