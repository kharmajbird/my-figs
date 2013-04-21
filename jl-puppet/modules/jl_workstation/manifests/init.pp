class jl_workstation {

    file { '/home/modernpharoah/.bashrc':
        ensure => 'file',
        mode => '0644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///jl_workstation/dot.bashrc',
        require => [
            User['modernpharoah'],
        ],
    }
    file { '/home/modernpharoah/.gitconfig':
        ensure => 'file',
        mode => '0644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///jl_workstation/dot.gitconfig',
        require => [
            User['modernpharoah'],
        ],
    }
    file { '/etc/vpnc/pavlov.conf':
        ensure => 'file',
        mode => '0400',
        owner => 'root',
        group => 'root',
        source => 'puppet:///jl_workstation/pavlov.conf',
        require => [
            Package['vpnc'],
        ],
    }
    file { '/etc/default/grub':
        ensure => 'file',
        mode => '0644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///jl_workstation/grub.default',
    }
    file { '/boot/grub/custom.cfg':
        ensure => 'file',
        mode => '0644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///jl_workstation/custom.cfg',
    }
    file { '/boot/JayOS-Laptop-14.png':
        ensure => 'file',
        mode => '0644',
        owner => 'root',
        group => 'root',
        source => 'puppet:///jl_workstation/JayOS-Laptop-14.png',
    }


    package { 'firmware-linux-free': ensure => 'installed', }
    package { 'vpnc': ensure => 'installed', }
    package { 'puppet': ensure => 'installed', }
    package { 'puppetmaster': ensure => 'installed', }
    package { 'virtualbox': ensure => 'installed', }
    package { 'xtightvncviewer': ensure => 'installed', }
    package { 'git': ensure => 'installed', }
    package { 'gparted': ensure => 'installed', }
    package { 'aespipe': ensure => 'installed', }
    package { 'vim-tiny': ensure => 'purged', }
    package { 'vim': ensure => 'installed', }
    package { 'transmission': ensure => 'installed', }
    package { 'pidgin': ensure => 'installed', }
    package { 'wifi-radar': ensure => 'installed', }


##    mount { '/home':
##        device => '/dev/sda3',
##        ensure => 'mounted',
##        fstype => 'ext4',
##    }
##    mount { '/lfs':
##        device => '/dev/sda2',
##        ensure => 'mounted',
##        fstype => 'ext3',
##    }
##    mount { '/scratch':
##        device => '/dev/sda4',
##        ensure => 'mounted',
##        fstype => 'ext4',
##    }
    user { 'modernpharoah':
        ensure => 'present',
        comment => 'ModernPharoah',
        uid => '1000',
        gid => '1000',
        groups => 'modernpharoah',
        home => '/home/modernpharoah',
        shell => '/bin/bash',
    }


##    exec { 'update-grub':
##        command => 'update-grub',
##        logoutput => 'true',
##        require => [
##            File['/etc/default/grub'],
##            File['/boot/grub/custom.cfg'],
##        ],
##    }
}
