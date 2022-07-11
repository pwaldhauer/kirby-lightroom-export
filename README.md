# KirbyExport

Lightroom Classic Plugin um Bilder direkt in eine Kirby-Instanz hochzuladen.

Im Grunde ist es aber ein Plugin, um Bilder an einen beliebigen HTTP-Endpunkt zu übertragen, kann also für jedes System verwendet werden.


## Installation

File -> Plugin Manager und dann einfach die .lrdevplugin Datei / den Ordner öffnen.

## Kirby

Für Kirby könnte das z.B. so aussehen:

```php
 'routes' => [
        [
            'pattern' => 'geheimer-endpunkt-name',
            'method' => 'POST',
            'action' => function() {
                if(empty($_FILES['exportFile'])) {
                    return 'No Image given';
                }

                $file = $_FILES['exportFile'];
                $name = $file['name'];

                $maybeExistingImage = site()->index()->images()->filterBy('filename', $name)->first();

                if(!empty($maybeExistingImage)) {
                    kirby()->impersonate('kirby');     
                    $maybeExistingImage->replace($file['tmp_name']);
                    return 'Replaced' . $maybeExistingImage->root();
                }

                return 'No Image Found';
            }
        ],
    // [...]
]

```

## Achtung, dieses Plugin enthält keine Authentifizierung

Könnt ihr ja selber einbauen, es ist nur Lua! Ich würde empfehlen einfach einen geheimen Endpunkt-Namen zu verwenden, hier ein paar Beispiele:

- asdfghjkl1234567
- hier-koennt-ihr-bilder-austauschen
- lightroom-ich-finde-dich-super-2000


## Lizenz

MIT