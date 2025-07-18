package Bio::KBase::KIDL::KBT::Scalar;
use Moose;

use Moose::Util::TypeConstraints;
enum 'ScalarType' => [qw(int float string bool freeform)];

has 'scalar_type' => (isa => 'ScalarType', is => 'rw');

our %java_class_type_map = (int	   => 'Integer.class',
			    float  => 'Float.class',
			    string => 'String.class',
			    bool   => 'Boolean.class');

sub java_type_expression
{
    my($self) = @_;
    return $java_class_type_map{$self->scalar_type};
}

sub get_validation_code
{
    return 'Params::Validate::SCALAR';
}

sub get_validation_routine
{
    my($self, $var) = @_;
    if ($self->scalar_type eq 'freeform')
    {
	return "1";
    }
    else
    {
	my $val = "!ref($var)";
	return $val;
    }
}

sub as_string
{
    my($self) = @_;
    return $self->scalar_type;
}

sub english
{
    my($self) = @_;
    my $t = $self->scalar_type;
    if ($t =~ /^[aeiou]/i)
    {
	$t = "an $t";
    }
    else
    {
	$t = "a $t";
    }
    
    return $t;
}

sub subtypes
{
    return [];
}

1;
