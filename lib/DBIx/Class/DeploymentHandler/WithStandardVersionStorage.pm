package DBIx::Class::DeploymentHandler::WithStandardVersionStorage;
use Moose::Role;

use DBIx::Class::DeploymentHandler::VersionStorage::Standard;

has version_storage => (
  does => 'DBIx::Class::DeploymentHandler::HandlesVersionStorage',
  is  => 'ro',
  lazy_build => 1,
  handles =>  'DBIx::Class::DeploymentHandler::HandlesVersionStorage',
);

sub _build_version_storage {
  DBIx::Class::DeploymentHandler::VersionStorage::Standard
    ->new({ schema => $_[0]->schema });
}

1;

__END__

vim: ts=2 sw=2 expandtab