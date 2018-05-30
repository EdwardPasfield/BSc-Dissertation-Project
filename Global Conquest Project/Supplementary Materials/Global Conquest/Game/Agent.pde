class Agent
{
  boolean aNAt = false;
  boolean aSAt = false;
  boolean aASt = false;
  boolean aAUt = false;
  boolean aEUt = false;
  boolean aAFt = false;

  int aaroll1;
  int aaroll2;

  int atroopnum;

  int rand;

  IntList tell;

  Agent(boolean NA, boolean SA, boolean AS, boolean AU, boolean EU, boolean AF, int aattroll1, int aattroll2, int randomterr, int troops)
  {

    NA = aNAt;
    SA = aSAt;
    AS = aASt;
    AU = aAUt;
    EU = aEUt;
    AF = aAFt;

    //create list of territories
    tell = new IntList();
    tell.append(0);
    tell.append(1);
    tell.append(2);
    tell.append(3);
    tell.append(4);
    tell.append(5);

    aaroll1 = attroll1;
    aaroll2 = aattroll2;

    rand = randomterr;
  }


  void mouseClicked()
  {


    ////////IntList management,
    //if south america is in list and owned by user
    if (tell.get(0) == 0 && uArray[0].SAt == true)
    {
      // print("SA");
      //set value of south america position in list to -1
      tell.set(0, -1);
    }
    //if not owned then set to 0
    else
    {
      if (uArray[0].SAt == false)
      {
        tell.set(0, 0);
      }
    }

    //if North america is in list and owned by user
    if (tell.get(1) == 1 && uArray[0].NAt == true)
    {
      // print("NA");
      //set value of North america position in list to -1
      tell.set(1, -1);
    }
    //if not owned then set to 0
    else
    {
      if (uArray[0].NAt == false)
      {
        tell.set(1, 1);
      }
    }
    //if Asia is in list and owned by user
    if (tell.get(2) == 2 && uArray[0].ASt == true)
    {
      // print("AS");
      //set value of Asia position in list to -1
      tell.set(2, -1);
    }
    //if not owned then set to 0
    else
    {
      if (uArray[0].ASt == false)
      {
        tell.set(2, 2);
      }
    }

    //if Australia is in list and owned by user
    if (tell.get(3) == 3 && uArray[0].AUt == true)
    {
      // print("AU");
      //set value of Australia position in list to -1
      tell.set(3, -1);
    }
    //if not owned then set to 0
    else
    {
      if (uArray[0].AUt == false)
      {
        tell.set(3, 3);
      }
    }

    //if Europe is in list and owned by user
    if (tell.get(4) == 4 && uArray[0].EUt == true)
    {
      // print("EU");
      //set value of Europe position in list to -1
      tell.set(4, -1);
    }
    //if not owned then set to 0
    else
    {
      if (uArray[0].EUt == false)
      {
        tell.set(4, 4);
      }
    }

    //if Africa is in list and owned by user
    if (tell.get(5) == 5 && uArray[0].AFt == true)
    {
      //print("AF");
      //set value of Africa position in list to -1
      tell.set(5, -1);
    }
    //if not owned then set to 0
    else
    {
      if (uArray[0].AFt == false)
      {
        tell.set(5, 5);
      }
    }
    //Create the list of all non user owned territories
    IntList in = new IntList();
    if (tell.get(0) == 0)
    { in .append(0);
    }
    if (tell.get(1) == 1)
    { in .append(1);
    }
    if (tell.get(2) == 2)
    { in .append(2);
    }
    if (tell.get(3) == 3)
    { in .append(3);
    }
    if (tell.get(4) == 4)
    { in .append(4);
    }
    if (tell.get(5) == 5)
    { in .append(5);
    }
    //print(in);

    ////////ENEMY TROOP ALLOCATION
    if (aonetn > 0)
    {
      //if it is still the initial troop allocation
      if (count < 15)
      {
        //assign troop to any random territory
        int index = int(random(tArray.length));
        tArray[index].atroopnum = tArray[index].atroopnum + 1;
        //minus 1 from the agents troop reserve
        aonetn = aonetn - 1;

      }
      else
      {
        //everytime there is a click assign an enemy troop to a non user owned territory
        int index = int(random( in .size()));
        int use = in .get(index);

        tArray[use].atroopnum = tArray[use].atroopnum + 1;
        //-1 from the agents troop reserve
        aonetn = aonetn - 1;
        //when the user runs out of troop reserves
        if (utn == 0)
        {
          //print("HI");
          /////// use list for random allocation but only on agent owned territories...
          for (int i = aonetn; i > 0; i--)
          {
            int r = int(random( in .size()));
            int us = in .get(r);
            tArray[us].atroopnum = tArray[us].atroopnum + 1;
            aonetn = aonetn - 1;

          }
        }
      }
    }
    //////////////////////ENEMY ATTACKS
    if (tclicked == true)
    {
      //chose a random non user owned territory
      int randatt = int(random( in .size()));
      int use = in .get(randatt);
      if (tArray[use].tnum == 0)
      {
        //Feedback for user to see where the enemy attacked
        println("Enemy attacked: South America");
      }
      if (tArray[use].tnum == 1)
      {
        println("Enemy attacked: North America");
      }
      if (tArray[use].tnum == 2)
      {
        println("Enemy attacked: Asia");
      }
      if (tArray[use].tnum == 3)
      {
        println("Enemy attacked: Australia");
      }
      if (tArray[use].tnum == 4)
      {
        println("Enemy attacked: Europe");
      }
      if (tArray[use].tnum == 5)
      {
        println("Enemy attacked: Africa");
      }

      //carry out attack on non user owned territory
      if (tArray[use].atroopnum < aArray[0].aaroll1)
      {
        tArray[use].troopnum = tArray[use].troopnum - tArray[use].atroopnum;
      }
      else
      {
        tArray[use].troopnum = tArray[use].troopnum - aArray[0].aaroll1;
      }
      //Dont allow user/agent troop numbers to drop below 0
      if (tArray[use].troopnum < 0)
      {
        tArray[use].troopnum = 0;
      }
      if (tArray[use].atroopnum < 0)
      {
        tArray[use].atroopnum = 0;
      }

      tclicked = false;
    }
  }
}