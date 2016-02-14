# Assimp module

## Module

Puppet module of the Open Asset Import Library (assimp). The assimp library is available via Github.

https://github.com/assimp/assimp

1. Download the latest stable version from Github
2. Install dependencies (g++, python, ..)
3. Compile using cmake and make
4. Install Python bindings

## Dependencies

```
puppet module install puppetlabs-vcsrepo
```

## Use python bindings

```
python
import pyassimp
```

## Adding agent

```
apt-get install puppet
#apt-get update
```
```
/etc/hosts
172.17.0.3 puppet puppet.example.com
```
```
/etc/puppet/puppet.conf
[agent]
server = puppet.example.com
```
```
puppet agent --enable
puppet agent -t # agent
```

In master:
```
puppet cert list
puppet cert sign <id>
```

## Install 
```
puppet agent -t # agent
```

## License

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Contact

Alejandro Sanchez Acosta <asanchez@neurowork.net>

