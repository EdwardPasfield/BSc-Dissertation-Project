class Territory{
  //create global territory constants
float bx;
float by;
int boxSize = 35;
int i,y,x;
PImage terrimage;
int troopnum, atroopnum;  
int click;
int tnum;
//create the array object framework for a territory
Territory(int posX, int posY, String tname, int utroops, int atroops, int terrnum){
  y = posY;
  x = posX;
  terrimage = loadImage(tname);
  troopnum = utroops;
  atroopnum = atroops;
  tnum = terrnum;
}

  
void update(){
 
            if(tArray[0].atroopnum > 30){
              tArray[0].atroopnum = 30;
            }
             if(tArray[1].atroopnum > 35){
              tArray[1].atroopnum = 35;
            }
             if(tArray[2].atroopnum > 50){
              tArray[2].atroopnum = 50;
            }
             if(tArray[3].atroopnum > 20){
              tArray[3].atroopnum = 20;
            }
             if(tArray[4].atroopnum > 30){
              tArray[4].atroopnum = 30;
            }
             if(tArray[5].atroopnum > 35){
              tArray[5].atroopnum = 35;
            }
            if(tArray[0].troopnum > 30){
              tArray[0].troopnum = 30;
            }
             if(tArray[1].troopnum > 35){
              tArray[1].troopnum = 35;
            }
             if(tArray[2].troopnum > 50){
              tArray[2].troopnum = 50;
            }
             if(tArray[3].troopnum > 20){
              tArray[3].troopnum = 20;
            }
             if(tArray[4].troopnum > 30){
              tArray[4].troopnum = 30;
            }
             if(tArray[5].troopnum > 35){
              tArray[5].troopnum = 35;
            }
}
  
  
}