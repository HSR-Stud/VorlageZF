# Vorlage Zusammenfassung

Das folgende Repo dient als Vorlage für die Erstellung von eigenen Repos.
Bitte beachte insbesondere folgende wenigen [Vorgaben](https://github.com/HSR-Stud/Willkommen/blob/master/Contributing.md#i-want-to-write-a-new-cheat-sheet-for-a-module), um die Ordnung auf HSR-Stud zu erhalten und schaffen. Falls du noch keine Ahnung von HSR-Stud, LaTeX oder Git im Allgemeinen hast, findest du [hier](https://github.com/HSR-Stud/Willkommen) viele wichtige Informationen. Weiterführende Infos wie ein Markdown-File funktioniert findest du [hier](https://guides.github.com/features/mastering-markdown).

## How To Use

1. Neu Repo mit [Use This Template](https://github.com/HSR-Stud/VorlageZF/generate) erstellen
2. `Vorlage.tex` umbenennen. Z.B. `Ph1Mech.tex`
3. Auch im Dokument die folgende Linie aktualisieren
   ```latex
   % !TEX root = Ph1Mech.tex
   ```
3. `README.md` aktualisieren (gemäss Vorlage [unten](#readme-vorlage))
4. Zusammenfassen!

## README Vorlage
```md 
# <Module> Zusammenfassung
Kurzbeschreibung (e.g. Zusammenfasssung der Vorlesung <Modul> Semester <Jahr> von <Kursleiter> an der HSR)

## Inhalt

- Behandelte Themenfeld 1
  + Behandelte Thema 1
  + Behandelte Thema 2
- Behandelte Themenfeld 2
  + ...

## Contributors

Es ist fair, alle Leute zu erwähnen, die zu einer Zusammenfassung beigetragen haben.

- <Vorname Name> (<HSR-Kürzel>)

## License
See `LICENSE` file
```
