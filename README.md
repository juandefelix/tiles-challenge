# The Tiles Challenge 

Full stack Rails code challenge for prospective Charlie team members.

## Overview

This application displays a home screen with a 8 x 8 grid of clickable tiles. Inside each tile there's a word representing rock bands, beer styles, colors, countries, cities, latin words, etc.  
When you click a tile, the tile will dissapear and the word previously displayed will be placed in a Sidekiq queue and the Sidekiq worker will store the word in a MongoDb database asynchronoulsy along with a timestamp.  
Randomly the controller will raise an exception when trying to place the task in the worker. In this case, the tile won't dissapear and it will turn red. You can try to click again on it or move to other tiles. The random exception will be raised once in ten clicks more or less.  
When you click on the last tile reamining on the grid, the app will redirect to a list of the 10 most ckicked words. Everytime you reload the home page, the tiles will display a different word.  

You can find the app deployedn heroku [here](http://jortiztileschallenge.herokuapp.com)
