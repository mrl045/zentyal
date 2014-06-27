# Copyright (C) 2012-2013 Zentyal S.L.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

use strict;
use warnings;

package EBox::Samba::Composite::FileSharing;

use base 'EBox::Model::Composite';

use EBox::Gettext;

# Group: Public methods

# Method: _description
#
# Overrides:
#
#     <EBox::Model::Composite::_description>
#
sub _description
{
    my $description = {
       layout          => 'tabbed',
       name            =>  __PACKAGE__->nameFromClass,
       pageTitle       => __('File Sharing'),
       printableName   => __('File sharing options'),
       compositeDomain => 'Samba',
       #help            => __(''), # TODO
    };

    return $description;
}

# Method: componentNames
#
# Overrides:
#
#     <EBox::Model::Composite::componentNames>
#
sub componentNames
{
    my ($self) = @_;

    my @components = qw(SambaShares RecycleBin Antivirus);

    if (EBox::Global->modExists('remoteservices')) {
        my $rs = EBox::Global->modInstance('remoteservices');
        if ($rs->filesSyncAvailable()) {
            push (@components, 'SyncShares');
        }
    }

    return \@components;
}

# Method: precondition
#
# Check if the module is configured
#
# Overrides:
#
# <EBox::Model::Base::precondition>
#
sub precondition
{
    my ($self) = @_;

    return $self->parentModule()->isProvisioned();
}

# Method: preconditionFailMsg
#
# Check if the module is configured
#
# Overrides:
#
# <EBox::Model::Model::preconditionFailMsg>
#
sub preconditionFailMsg
{
    my ($self) = @_;

    return __('You need to enable Users module in the module status section and save changes in order to use it.');
}

1;