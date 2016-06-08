# DLASimulator v.6

![DLA Simulator](https://github.com/RyosukeCla/DLASimulator/blob/images/IMG_2016y6m6d3h13m28.png?raw=true)
Diffusion Limited Aggregation Model Simulator with Processing

this programm was created with processing 3.0.

``Info``

- @autor ... Ryosuke Suzuki
- @created . 05/29/2016
- @updated . 06/08/2016

***

### HISTORY

VERSION 6 - NEW
 - major update
 - add GUI
 - improve photo
 
VERSION 5
 - major update
 - fix
   - fix word : precipitation -> deposition
 - optimize
   - optimize collision
   - optimize graphics : while stopping, stable fps - 60
 - add Button
   - generate micro particles

VERSION 4
 - minor update
 - fix
   - fix spell : pricipitation -> precipitation
   - fix collision : better collision
   
VERSION 3
 - major update
 - add Menu
   - add menu button : see the left-top, you will see one button. and if you clicked this button, menus will appear!!!
   - add potential difference : effect on movement of particle towords to center position. in experiment of 7th GENSYOJIKKEN, center position is a lead of pencil.
   - add stop button : you can stop movement of particles. enjoy watching fractale!
   - add take picture button : can take a image of dla. and save to D:"/photo/". see this (DLA) folder. then you will find "photo" folder.
   - add regenerate dla button : can regenerate DLA. so you dont have to re-start this anymore!
 - improve graphics
   - add circle of potential difference : red, blue.
 - fix
   - fix collision : better collisions compatible with particle velocity.
 - add algorithms
   - add new paritlces movement : add effect by poteintial difference.
   
VERSION 2
 - major update
 - add Parameters
   - add pricipitation rate : whether particle become cluster or not. in Japanese, "SEKISYUTURITU".
   - add particle velocity
 - improve graphics
   - add max distance circle
 - improve algorithms
   - improve  calculating collisions : space partitioning.
 
***

### HOW TO USE
1. Run this code with processing.
![run](https://github.com/RyosukeCla/DLASimulator/blob/images/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202016-06-06%203.02.37.png?raw=true)

2. Click the left-top button. Then utilities will show.
![click menu button](https://github.com/RyosukeCla/DLASimulator/blob/images/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202016-06-05%2018.07.00.png?raw=true)

3. Watch DLA molding!!

4. This picture was taken in this simulator by clicking ``take picture`` button.(version 6)
![picture](https://github.com/RyosukeCla/DLASimulator/blob/master/DLASimulator_v6/DLA_v6/photo/IMG_SAMPLE.png?raw=true)

***

### FEATURES
- Modern GUI
  - nice menu
  - nice graph
  - nice slider
  - nice button
- A lot of parameters
  - precipitation rate
  - particle velocity
  - potential difference
- A lot of utilities
  - menu button
  - change parameters with slider
  - easily taking pictures
  - easily stopping
  - easily regenerate dla
- Optimization
  - space partitioning
  - emitting particles

  
