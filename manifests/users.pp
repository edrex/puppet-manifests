
class user::virtual {
    @realuser { 
    "chris":
        uid     => "1001",
        comment => "Christopher Pitzer",
	groups  => ["sudo","admin","postgresql-admin"],
	key	=> "AAAAB3NzaC1yc2EAAAABIwAAAQEA00HE43W2K0b12cR/sA234nj7RkpBc0pXEFdcEGy4a0PAZlqeAkDke4tf1an+GAM1SPAM4zlXtcURTOPaom6S1BXXfs3pdCz2dbi5Vi9PFZYsYaywYF/xPIjHCc7wBnkVlOdAVN41k5TVvi8Y6c9fpiPOIza8jSyZrJCD7Ho/52qOsjOO/8lqbbyeXdhpHi5muwxpPcKz6s+l1J2xjAg0jzkWDRYzemhi4w7tnN0oHCkMtiOi/bmybomQphLTj82volpS7g352MMV85OH9okE18Eqe8R81k9X7GZqTYgmiyg5NPZx+5ZOpneST7E58p8EI+FDDby3hpbgvgUEm76MAQ==";
    "jeff":
        uid     => "1002",
        comment => "Jeff Schwaber",
	groups  => ["sudo","admin","postgresql-admin"],
	key	=> "AAAAB3NzaC1yc2EAAAABIwAAAQEA16xH0N8NkN3wb0ZMv3EJz8RYtM/9RN1y0P25dRoXSvI+r2Xpb9vhEFhhr8cOn4cMrKPxJvjDiMaImfzf4NUhrAMIrJHydV5C4ZWphkJV3Cx2XI6f6eQILoZuL7024hkWqmgceYymBoDtedj+WhR+NjSDckKjELf8I9uzOC1drP+r8xXEmccztpO88CH4uKh+LK5h5QX9H8mWaEpRqzYBQX/5dhEtGVhI47syvZn+h5AXqUJAh2ZlxLqMRG3fT+FUm58w/HEkgxSDtM4hNDYDPbakvjK6IjNtwC1nKGC4FyeTpWugbjElWl43pTATwF+dyJ+P+QHvEQ+JkwhXrGRQIw==";
    "eric":
        uid     => "1003",
        comment => "Eric Drechsel",
	groups  => ["sudo","admin","postgresql-admin"],
	key	=> "AAAAB3NzaC1kc3MAAACBAJgDnequ23T9uDR6jtCtrB3A/tkGQAmx2R5gZi8BMLFkh2intJtBi6/RlR8DGcIiDiJIdAbQm9ubkrLt1A+dybVH8WTwweggyCAwopS4JTgpi1gUuoCn2dARJBy6vEAyEast7kdkcBBCUQlMbBdjRh9bJAn0Vp3t02QafJja7r1VAAAAFQDoUVVRxHgonk0seTPeE78sUo7PlwAAAIEAhiXPeGmZXb0VhSrwOVkAwGBQWRBTCdv9KIPDp13/Q6X9FFMAwA9vYwcco7QfdEBoBfxJZ7YAKF3veZ03Eowpw+l+dKBnJz7ZUEqectDQSgPAhAm+S6kbcCYKCPKiIoBFffvznvulEgr3G5lV/IsgOVX/EVIiIeYGAORFnb1X6/cAAACBAI5e/xSienkRjm9lPr/5LiW88hro4/183g8hewjLzceDv5wHGpvCo3MymAiJm7N1fDpemqQn7or0u5rN1Da7aP5yhIqAAC9oXsGYpH7wF4JTALEpnJfMWSk1YDeH86IhPrhlZM4tfcnpAoGXajCzyGWgWNtMmgxDVB3pChl43oBW",
	keytype	=> "ssh-dss";
    }
}

class user::sqrly_team inherits user::virtual {
    # Realize our team members
    realize(
        RealUser["eric","chris","jeff"],
    )
}

