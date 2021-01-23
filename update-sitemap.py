with open('sitemap_new.xml', 'w') as wfile:
	with open('sitemap.xml') as ofile:
		for line in ofile:
			if '<loc>' in line:
				lsplit = line.split('<loc>')

				wfile.write('{}<loc>https://ddarmon.github.io{}'.format(lsplit[0], lsplit[1]))
			else:
				wfile.write(line)