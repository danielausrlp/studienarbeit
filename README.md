# Studienarbeit Daniel Tscherkaschin

## Vorwort

Im Rahmen dieser Studienarbeit habe ich eine Reihe interaktiver *Jupyter Notebooks* entwickelt, die zentrale Konzepte und praktische Anwendungen in der modernen C++‑Programmierung anschaulich vermitteln. Die Notebooks sind nicht nur lokal lauffähig, sondern auch auf *Google Colab* verfügbar, sodass interessierte Studierende und Entwickler den Code direkt im Browser ausführen und selbst experimentieren können. Der Fokus liegt darauf, theoretisches Wissen praxisnah umzusetzen und anhand konkreter Beispiele ein tieferes Verständnis für unterschiedliche Programmierparadigmen und Technologien zu schaffen.

## Motivation

Die Informatik lebt von praktischer Anwendung und anschaulichen Beispielen: Theorie wird erst dann wirklich greifbar, wenn sie sichtbar wird und direkt ausprobiert werden kann. Gerade in der System- und Anwendungsentwicklung mit C++ ergeben sich komplexe Themen wie Performance‑Vergleiche, Netzwerkprogrammierung oder Speicherverwaltung, die in klassischen Lehrbüchern oft abstrakt behandelt werden. Mit interaktiven Notebooks lässt sich dieses Wissen nicht nur erklären, sondern auch direkt erfahrbar machen. Durch die Ergänzung um Umgebungen wie Google Colab wird die Hürde bewusst niedrig gehalten, sodass jeder ohne lokale Installation der Werkzeuge die Modelle und Beispiele kennenlernen kann. Die SoS‑Notebook‑Lektion erweitert diese Perspektive zusätzlich, indem sie zeigt, wie man polyglotte Workflows in einem Notebook‑Kontext realisieren kann — ein moderner Ansatz für cross‑linguale Analyse‑ und Programmieraufgaben.

Liste erstellter Notebooks:

-   [BenchmarkCppvsPy.ipynb](BenchmarkCppvsPy.ipynb)
-   [NetworkingUnix.ipynb](NetworkingUnix.ipynb)
-   [SafeCPP.ipynb](SafeCPP.ipynb)
-   [SmartPtrCPP.ipynb](SmartPtrCPP.ipynb)
-   [Introduction pigpio.ipynb](Introductionpigpio.ipynb)
    -   [pigpioC.ipynb](pigpioC.ipynb)
-   [SoSNotebook.ipynb](SoSNotebook.ipynb)

## Erläuterung der Notebooks

### BenchmarkCppvsPy:

In diesem Notebook werden verschiedene Algorithmen – darunter die rekursive Fibonacci-Funktion und ein Primzahlgenerator – sowie deren Laufzeiten in C++ und Python untersucht und miteinander verglichen.

Außerdem werden unterschiedliche Problemgrößen (z. B. größere Werte von N) betrachtet, um zu zeigen, dass der Laufzeitunterschied zwischen C++ und Python mit zunehmender Komplexität immer deutlicher wird.

Studierende haben zudem die Möglichkeit, im Rahmen einer Übung einen Algorithmus ihrer Wahl zu implementieren, um besser einschätzen zu können, welche Programmiersprache für ihre Zwecke geeigneter ist.
<br></br>
### NetworkingUnix:

Dieses Notebook bietet eine Einführung in die Socket-Programmierung unter Unix/Linux mithilfe von C++. Es behandelt die grundlegenden Konzepte von Sockets als Kommunikationsendpunkte und erläutert zentrale Systemaufrufe wie `socket()`, `bind()`, `listen()`, `accept()`, `connect()` und `send()`.

Anhand praktischer Beispiele werden mehrere Anwendungen implementiert:

-   TCP-Server und TCP-Client: Einfache Client/Server-Kommunikation mit Nachrichtenaustausch.

-   HTTP-Server: Aufbau eines einfachen Servers, der HTTP-Anfragen verarbeitet und „Hello World“-Antworten liefert.

-   Chat-Software: Ein mehrthreadiger Client/Server-Chat, bei dem Nachrichten gleichzeitig gesendet und empfangen werden können (mit Hilfe von `std::thread`).

Abschließend enthält das Notebook eine Übung, in der Studierende einen eigenen TCP-Server und -Client programmieren sollen, um die erlernten Konzepte praktisch anzuwenden. Die Beispiele zeigen sowohl den Umgang mit IP-Adressen und Ports als auch das Management von Sockets und Threads in C++.
<br></br>
### SafeCPP:

Dieses Notebook behandelt typische Speicherfehler in C/C++ und zeigt, wie man sie vermeiden kann.

C und C++ geben Programmierern extrem viel Kontrolle über Speicher und Hardware. Gleichzeitig liegt die Verantwortung komplett beim Entwickler. Schon kleine Fehler beim Umgang mit Zeigern, Arrays oder dynamischem Speicher können zu Programmabstürzen, Datenkorruption oder kritischen Sicherheitslücken führen. Daher ist es entscheidend, von Anfang an sichere Programmierpraktiken zu beachten, Eingaben zu validieren und bewährte Methoden wie Smart Pointer, sichere Funktionen und Bounds-Checks zu verwenden.

Behandelte Fehler & Probleme:
-   Buffer Overflow
    - Stack & Heap
-   User-after-Free
-   Double Free
-   Dangling Pointer
-   Pointer auf `std::vector`-Elemente
-   Out-of-Bounds Read/Write
-   Unsichere Funktionen

Als Übung sollen Studierende einen fehlerhaften / unsicheren Code analysieren und die gelernten Konzepte anwenden.
<br></br>
### SmartPtrCPP:

Dieses Notebook zeigt, warum Smart Pointer in modernem C++ unverzichtbar sind und wie sie typische Speicherfehler automatisch verhindern. Folgende Smart Pointer werden erläutert:

-   `std::unique_ptr` gewährleistet exklusiven Besitz eines Objekts. Es verhindert Memory Leaks, Double Frees und Use‑After‑Free, indem der Speicher beim Verlassen des Scopes zuverlässig freigegeben wird.

-   `std::shared_ptr` ermöglicht geteilten Besitz eines Objekts mithilfe einer Referenzzählung. Der Speicher wird erst freigegeben, wenn der letzte Besitzer verschwindet.

-   `std::weak_ptr` dient als nicht-besitzender Verweis auf ein durch shared_ptr verwaltetes Objekt. Er verhindert Referenzzyklen, die ansonsten zu Memory Leaks führen würden.

Smart Pointer machen C++ deutlich sicherer und entlasten Entwickler von vielen Fehlerquellen der manuellen Speicherverwaltung. Eine zentrale Grundlage für moderne, robuste und fehlerarme Softwareentwicklung.

Im Rahmen einer Übung sollen Studierende einen eigenen *Smart-Pointer* implementieren, indem Sie Gebrauch von *Konstruktoren* und *Destruktoren* in C++ machen.
<br></br>
### Introduction pigpio und pigpioC

Das Notebook beschreibt, wie man Jupyter Notebook auf einem Raspberry Pi installiert, den Server startet und anschließend das mitgelieferte pigpioC-Notebook herunterläd, um LED- und I2C-Projekte mit C/C++ zu testen.

Dies hat den Vorteil, dass Studierende den Code direkt auf dem Raspberry Pi von dem Notebook aus ausführen können.

Dabei wird ein Installationsskript `setup_jupyter_py.sh` bereitgestellt, was die Installation und Einrichtung von Jupyter Notebook automatisch durchführt.
<br></br>
### SoSNotebook:

Dieses Notebook zeigt, wie der SoS-Kernel innerhalb eines Docker-Containers genutzt werden kann, um Notebooks in mehreren Programmiersprachen zu erstellen, zu bearbeiten und auszuführen.

Sie lernen:

-   Wie der Docker-Container gestartet und gestoppt wird (sos_start / sos_stop)

-   Wie der Jupyter-Server über den Browser erreichbar ist

-   Wie Code-Zellen verschiedenen Kernels (Python, C++, etc.) zugewiesen werden

-   Wo die erstellten Notebooks gespeichert werden (~/sosNotebooks)

-   Dass zusätzliche Programmiersprachen-Kernels bei Bedarf installiert werden können

Am Ende gibt es ein kurzes Einführungsvideo, das die wichtigsten Schritte zusammenfasst.

## Related works

[SoS Notebook: Multi‑Language Environment](https://academic.oup.com/bioinformatics/article/34/21/3768/5001386)
Bo Peng et al. (2018) — SoS Notebook: an interactive multi‑language data analysis environment.
Diese Veröffentlichung beschreibt die Entwicklung des SoS Notebooks als eine Umgebung, die mehrere Skriptsprachen in einem einzigen Notebook ermöglicht und Daten zwischen ihnen austauscht. Das Konzept adressiert typische Probleme heterogener Workflows in der Bioinformatik, lässt sich aber allgemein auf multi‑sprachige Analyse‑ und Entwicklungsaufgaben übertragen.

[Adapting Jupyter for C++ Programming Education](https://ojs.bonfuturepress.com/index.php/CETR/article/view/1515)
Diese Studie untersucht den Einsatz von Jupyter Notebooks im C++‑Unterricht an der Hochschule, vergleicht traditionelle Entwicklungsumgebungen mit Notebook‑basierten Laborpraktika und analysiert die Wahrnehmung von Studierenden hinsichtlich des interaktiven Lernens.

[Using Jupyter Notebooks as digital assessment tools](https://link.springer.com/article/10.1007/s10639-025-13507-7)
In dieser empirischen Studie analysieren Güler Yavuz Temel et al., wie Jupyter Notebooks als digitale Werkzeuge für formative und summative Lern‑ und Bewertungsaufgaben im Lehr‑Lern‑Prozess eingesetzt werden können. Die Ergebnisse zeigen, dass der Einsatz von Notebooks nicht nur die digitalen Kompetenzen der Teilnehmenden stärkt, sondern auch Einstellungen und Selbstwirksamkeit gegenüber digitalen Lernumgebungen positiv beeinflusst. Zusätzlich beleuchtet die Arbeit, wie interaktive Aufgaben, automatische Rückmeldungen und die Integration verschiedener Programmiersprachen zur Gestaltung vielseitiger Lernaktivitäten beitragen können.

## Fazit

Die erstellten Notebooks bieten einen breit gefächerten Einblick in moderne C++‑Themen und ermöglichen es, Konzepte praxisnah zu vertiefen. Durch interaktive Beispiele werden sowohl grundlegende Mechanismen als auch fortgeschrittene Patterns erlebbar gemacht, sei es bei der Messung und dem Vergleich von Algorithmen, der Netzwerkkommunikation unter Unix oder der sicheren Speicherverwaltung mit Smart Pointern. Zudem zeigt das SoS‑Notebook, wie flexible Multi‑Language‑Workflows in einem gemeinsamen Notebook‑Umfeld umgesetzt werden können, was insbesondere für wissenschaftliche und datenanalytische Anwendungen von großem Vorteil ist. Die Kombination aus didaktischer Struktur, ausführbaren Beispielen und Portabilität über Plattformen wie Google Colab schafft eine solide Grundlage für individuelles Lernen und weiterführende Projekte.