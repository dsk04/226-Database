<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>Simple Id Query #2</title>
</head>

<body>
    <?php
        function constructTable($data)
        {
            // We're going to construct an HTML table.
            print "    <table border='1'>\n";
                
            // Construct the HTML table row by row.
            $doHeader = true;
            foreach ($data as $row) {
                    
                // The header row before the first data row.
                if ($doHeader) {
                    print "        <tr>\n";
                    foreach ($row as $name => $value) {
                        print "            <th>$name</th>\n";
                    }
                    print "        </tr>\n";
                    $doHeader = false;
                }
                    
                // Data row.
                print "        <tr>\n";
                foreach ($row as $name => $value) {
                    print "            <td>$value</td>\n";
                }
                print "        </tr>\n";
            }
            
            print "    </table>\n";
        }
    
        $id = filter_input(INPUT_GET, "id");
        $artist = filter_input(INPUT_GET, "artist");
try {

	// Connect to the database.
     $con = new 					   		PDO("mysql:host=localhost;dbname=assignment04",
                           "James", "james");
            $con->setAttribute(PDO::ATTR_ERRMODE,
                               PDO::ERRMODE_EXCEPTION);

	if (strlen($id) > 0) 
	{        
            print "<h1>User with id $id</h1>\n";
                    
		$query = "SELECT User.user_id, Jukebox.jukebox_id, 					JukeBoxUserAlbum.jukebox_user_album_id,
				JukeBoxUserAlbum.user_album_id ".
     		       "FROM User, Jukebox, JukeBoxUserAlbum ".
         		 "WHERE User.user_id= :id ". 
         		"AND Jukebox.user_id = User.user_id ".
         		"AND JukeBoxUserAlbum.jukebox_id = 							Jukebox.jukebox_id ".
         		"ORDER BY user_id";

            $ps = $con->prepare($query);

            // Fetch the matching row.
            $ps->bindParam(':id', $id);
		 $ps->execute();

            $data = $ps->fetchAll(PDO::FETCH_ASSOC);
                        
            // $data is an array.
            if (count($data) > 0) {
                constructTable($data);
            }
            else {
                print "<h3>(No match.)</h3>\n";
            }
        }else if (strlen($artist) > 0) {        
            print "<h1>Artist with id $artist</h1>\n";
                    
		$query = "SELECT Artist.artist_id, Artist.name, 				Album.album_id, Album.publisher_id, 					      AlbumSong.album_song_id ".
     		       "FROM Artist, Album, ArtistAlbum, AlbumSong ".
         		 "WHERE Artist.artist_id = :artist ". 
         		"AND ArtistAlbum.artist_id = Artist.artist_id ".
         		"AND Album.album_id = ArtistAlbum.album_id ".
			"AND AlbumSong.album_id = Album.album_id ". 
         		"ORDER BY artist_id";

            $ps = $con->prepare($query);

            // Fetch the matching row.
            $ps->bindParam(':artist', $artist);
		 $ps->execute();

            $data = $ps->fetchAll(PDO::FETCH_ASSOC);
                        
            // $data is an array.
            if (count($data) > 0) {
                constructTable($data);
            }
            else {
                print "<h3>(No match.)</h3>\n";
            }
        }else
	{
		throw new Exception("Missing id.");
	}
	}
        catch(PDOException $ex) {
            echo 'ERROR: '.$ex->getMessage();
        }    
        catch(Exception $ex) {
            echo 'ERROR: '.$ex->getMessage();
        }

    ?>
</body>
</html>
