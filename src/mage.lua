local love = require 'love'

function mage_update()

    dialog = love.graphics.newImage("sprites/dialog.png")
    if (map_nb ~= 1 or monster[1].killed == true) then
        return nil       
    end 
    if vivant == true then
        if (player_pose[map_nb][1] == 16 and player_pose[map_nb][2] == 7) then
            love.graphics.draw(dialog, 1400, 300, 0, 2, 2)
            love.graphics.print("\n\nBonjour, vous venez surement\nprofiter\nde l'augmentationde la\nvaleur des\ndonjons en bourse,\net bien je vous souhait la\nbienvenue\nc'est un très bon choix\nque vous\nfaites là jeune chasseur\nde donjon,\nvous avez en face de vous\nun donjon \nde niveau 99 de classe\nénergétique A.\n\n\tBon courage", 1410, 310, 0, 2, 2)
            print("lkjze");
        end
        if (player_pose[map_nb][1] == 17 and player_pose[map_nb][2] == 6) then
            love.graphics.draw(dialog, 1400, 300, 0, 2, 2)
            love.graphics.print("\n\nBonjour, vous venez surement\nprofiter\nde l'augmentationde la\nvaleur des\ndonjons en bourse,\net bien je vous souhait la\nbienvenue\nc'est un très bon choix\nque vous\nfaites là jeune chasseur\nde donjon,\nvous avez en face de vous\nun donjon \nde niveau 99 de classe\nénergétique A.\n\n\tBon courage", 1410, 310, 0, 2, 2)
        end
        if (player_pose[map_nb][1] == 17 and player_pose[map_nb][2] == 8) then
            love.graphics.draw(dialog, 1400, 300, 0, 2, 2)
            love.graphics.print("\n\nBonjour, vous venez surement\nprofiter\nde l'augmentationde la\nvaleur des\ndonjons en bourse,\net bien je vous souhait la\nbienvenue\nc'est un très bon choix\nque vous\nfaites là jeune chasseur\nde donjon,\nvous avez en face de vous\nun donjon \nde niveau 99 de classe\nénergétique A.\n\n\tBon courage", 1410, 310, 0, 2, 2)
        end
    else
        if (player_pose[map_nb][1] == 16 and player_pose[map_nb][2] == 7) then
            love.graphics.draw(dialog, 1400, 300, 0, 2, 2)
            love.graphics.print("\n\nmort moi ? serieusement ^^ \n\
haha on me l avait pas sortie\
celle la\
depuis loooongtemps :)\
demande a\
mes potes mage si je suis\
mort tu vas voir\
les reponses que tu vas te\
prendre XD rien que la\
semaine passee je suis mort\
donc chuuuuut ferme la mortel\
de merde car oui toi tu \
mas tout l\
air d un bon mortel de\
merde car souvent vous etes\
frustrer de ne pas\
mourir", 1410, 310, 0, 2, 2)
            print("lkjze");
        end
        if (player_pose[map_nb][1] == 17 and player_pose[map_nb][2] == 6) then
            love.graphics.draw(dialog, 1400, 300, 0, 2, 2)
            love.graphics.print("\n\nmort moi ? serieusement ^^ \n\
haha on me l avait pas sortie\
celle la\
depuis loooongtemps :)\
demande a\
mes potes mage si je suis\
mort tu vas voir\
les reponses que tu vas te\
prendre XD rien que la\
semaine passee je suis mort\
donc chuuuuut ferme la mortel\
de merde car oui toi tu \
mas tout l\
air d un bon mortel de\
merde car souvent vous etes\
frustrer de ne pas\
mourir", 1410, 310, 0, 2, 2)
        end
        if (player_pose[map_nb][1] == 17 and player_pose[map_nb][2] == 8) then
            love.graphics.draw(dialog, 1400, 300, 0, 2, 2)
            love.graphics.print("\n\nmort moi ? serieusement ^^ \n\
haha on me l avait pas sortie\
celle la\
depuis loooongtemps :)\
demande a\
mes potes mage si je suis\
mort tu vas voir\
les reponses que tu vas te\
prendre XD rien que la\
semaine passee je suis mort\
donc chuuuuut ferme la mortel\
de merde car oui toi tu \
mas tout l\
air d un bon mortel de\
merde car souvent vous etes\
frustrer de ne pas\
mourir", 1410, 310, 0, 2, 2)
        end
    end
end