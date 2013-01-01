#!/bin/sh

mods=""
mods="$mods Bundle::CPAN"
mods="$mods Config::Tiny"
mods="$mods DBD::SQLite"
mods="$mods DBD::Pg"
mods="$mods DBD::mysql"
mods="$mods Devel::Cover"
mods="$mods Encode::Locale"
mods="$mods IO::String"
mods="$mods Bundle::LWP"
mods="$mods Modern::Perl"
mods="$mods Module::Starter"
mods="$mods Perl::Critic"
mods="$mods Perl::Tidy"
mods="$mods Pod::Coverage"
mods="$mods Clone"
mods="$mods Pod::PseudoPod"
mods="$mods Readonly"
mods="$mods Test::Deep"
mods="$mods Test::Fatal"
mods="$mods Test::CheckManifest"
mods="$mods Test::Perl::Critic"
mods="$mods Test::Pod"
mods="$mods Test::Pod::Coverage"
mods="$mods Try::Tiny"
mods="$mods XML::Simple"
mods="$mods XML::LibXML"

for m in $mods; do
    echo $m
    sudo cpan $m
done
