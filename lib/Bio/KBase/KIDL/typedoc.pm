####################################################################
#
#    This file was generated using Parse::Yapp version 1.05.
#
#        Don't edit this file, use source file instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
####################################################################
package typedoc;
use vars qw ( @ISA );
use strict;

@ISA= qw ( Parse::Yapp::Driver );
use Parse::Yapp::Driver;

#line 4 "typedoc.yp"

    use Devel::StackTrace;
    use Bio::KBase::KIDL::KBT;
    use Data::Dumper;
    use File::Spec;

our @valid_authentication_values = qw(required optional none);    
our %valid_authentication_value = map { $_ => 1 } @valid_authentication_values;

our %builtin_types = ('int' => Bio::KBase::KIDL::KBT::Scalar->new(scalar_type => 'int'),
		      'string' => Bio::KBase::KIDL::KBT::Scalar->new(scalar_type => 'string'),
		      'float' => Bio::KBase::KIDL::KBT::Scalar->new(scalar_type => 'float'),
#		      'bool' => Bio::KBase::KIDL::KBT::Scalar->new(scalar_type => 'bool'),
    );

our $auth_default = 'none';

our @kidl_keywords = qw(funcdef
    		        typedef
			module
			list
			mapping
			structure
			nullable
			returns
			authentication
			tuple
			async);
our %kidl_keywords = map { $_ => 1 } @kidl_keywords;

our @kidl_reserved = qw(abstract
			and
			as
			assert
			bool
			break
			byte
			case
			catch
			char
			class
			const
			continue
			debugger
			def
			default
			del
			delete
			do
			double
			elif
			else
			enum
			except
			exec
			extends
			final
			finally
			float
			for
			from
			function
			global
			goto
			if
			implements
			import
			in
			instanceof
			int
			interface
			is
			lambda
			let
			long
			native
			new
			not
			or
			package
			pass
			print
			private
			protected
			public
			raise
			return
			short
			static
			strictfp
			super
			switch
			synchronized
			this
			throw
			throws
			transient
			try
			typeof
			var
			void
			volatile
			while
			with
			yield
			none
			required
			optional
			);
our %kidl_reserved = map { $_ => 1 } @kidl_reserved;


sub new {
        my($class)=shift;
        ref($class)
    and $class=ref($class);

    my($self)=$class->SUPER::new( yyversion => '1.05',
                                  yystates =>
[
	{#State 0
		DEFAULT => -2,
		GOTOS => {
			'module_list' => 2,
			'start' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 3
		}
	},
	{#State 2
		ACTIONS => {
			'' => -1
		},
		DEFAULT => -8,
		GOTOS => {
			'module_opts' => 5,
			'module' => 4
		}
	},
	{#State 3
		DEFAULT => 0
	},
	{#State 4
		DEFAULT => -3
	},
	{#State 5
		ACTIONS => {
			'MODULE' => 6,
			'module_opt' => 7
		}
	},
	{#State 6
		DEFAULT => -4,
		GOTOS => {
			'@1-2' => 8
		}
	},
	{#State 7
		DEFAULT => -9
	},
	{#State 8
		ACTIONS => {
			'IDENT' => 10
		},
		GOTOS => {
			'mod_name_def' => 9
		}
	},
	{#State 9
		ACTIONS => {
			"{" => 11
		}
	},
	{#State 10
		ACTIONS => {
			":" => 12
		},
		DEFAULT => -6
	},
	{#State 11
		DEFAULT => -10,
		GOTOS => {
			'module_components' => 13
		}
	},
	{#State 12
		ACTIONS => {
			'IDENT' => 14
		}
	},
	{#State 13
		ACTIONS => {
			'ASYNC' => 21,
			'AUTHENTICATION' => 19,
			'TYPEDEF' => 18,
			'DOC_COMMENT' => 15,
			"}" => 25,
			"use" => 24
		},
		DEFAULT => -27,
		GOTOS => {
			'typedef' => 16,
			'module_component' => 17,
			'async_flag' => 22,
			'auth_type' => 20,
			'funcdef' => 23,
			'module_component_with_doc' => 26
		}
	},
	{#State 14
		DEFAULT => -7
	},
	{#State 15
		ACTIONS => {
			'AUTHENTICATION' => 19,
			'TYPEDEF' => 18,
			'ASYNC' => 21,
			"use" => 24
		},
		DEFAULT => -27,
		GOTOS => {
			'async_flag' => 22,
			'auth_type' => 20,
			'funcdef' => 23,
			'typedef' => 16,
			'module_component' => 27
		}
	},
	{#State 16
		DEFAULT => -14
	},
	{#State 17
		DEFAULT => -12
	},
	{#State 18
		ACTIONS => {
			'MAPPING' => 32,
			'TUPLE' => 33,
			'LIST' => 37,
			'TYPENAME' => 30,
			'IDENT' => 36,
			'STRUCTURE' => 34
		},
		GOTOS => {
			'list' => 29,
			'structure' => 28,
			'mapping' => 31,
			'tuple' => 38,
			'type' => 35
		}
	},
	{#State 19
		ACTIONS => {
			'IDENT' => 39
		}
	},
	{#State 20
		ACTIONS => {
			";" => 40
		}
	},
	{#State 21
		DEFAULT => -28
	},
	{#State 22
		ACTIONS => {
			'FUNCDEF' => 41
		}
	},
	{#State 23
		DEFAULT => -15
	},
	{#State 24
		ACTIONS => {
			"module" => 42
		}
	},
	{#State 25
		ACTIONS => {
			";" => 43
		}
	},
	{#State 26
		DEFAULT => -11
	},
	{#State 27
		DEFAULT => -13
	},
	{#State 28
		DEFAULT => -36
	},
	{#State 29
		DEFAULT => -37
	},
	{#State 30
		DEFAULT => -34
	},
	{#State 31
		DEFAULT => -35
	},
	{#State 32
		ACTIONS => {
			"<" => 44
		}
	},
	{#State 33
		ACTIONS => {
			"<" => 45
		}
	},
	{#State 34
		ACTIONS => {
			"{" => 46
		}
	},
	{#State 35
		ACTIONS => {
			'IDENT' => 47
		}
	},
	{#State 36
		DEFAULT => -39
	},
	{#State 37
		ACTIONS => {
			"<" => 48
		}
	},
	{#State 38
		DEFAULT => -38
	},
	{#State 39
		DEFAULT => -18
	},
	{#State 40
		DEFAULT => -17
	},
	{#State 41
		ACTIONS => {
			'STRUCTURE' => 34,
			'IDENT' => 49,
			'TYPENAME' => 30,
			'LIST' => 37,
			'MAPPING' => 32,
			'TUPLE' => 33
		},
		GOTOS => {
			'structure' => 28,
			'list' => 29,
			'mapping' => 31,
			'tuple' => 38,
			'type' => 50
		}
	},
	{#State 42
		ACTIONS => {
			'ident' => 51
		}
	},
	{#State 43
		DEFAULT => -5
	},
	{#State 44
		ACTIONS => {
			'IDENT' => 36,
			'TYPENAME' => 30,
			'LIST' => 37,
			'MAPPING' => 32,
			'TUPLE' => 33,
			'STRUCTURE' => 34
		},
		GOTOS => {
			'tuple' => 38,
			'type' => 52,
			'structure' => 28,
			'tuple_type' => 53,
			'list' => 29,
			'mapping' => 31
		}
	},
	{#State 45
		ACTIONS => {
			'LIST' => 37,
			'MAPPING' => 32,
			'TUPLE' => 33,
			'IDENT' => 36,
			'TYPENAME' => 30,
			'STRUCTURE' => 34
		},
		GOTOS => {
			'tuple_types' => 55,
			'type' => 52,
			'tuple' => 38,
			'list' => 29,
			'tuple_type' => 54,
			'structure' => 28,
			'mapping' => 31
		}
	},
	{#State 46
		ACTIONS => {
			'IDENT' => 36,
			'TYPENAME' => 30,
			'LIST' => 37,
			'MAPPING' => 32,
			'TUPLE' => 33,
			'STRUCTURE' => 34
		},
		GOTOS => {
			'struct_items' => 57,
			'mapping' => 31,
			'struct_item' => 56,
			'structure' => 28,
			'list' => 29,
			'tuple' => 38,
			'type' => 58
		}
	},
	{#State 47
		DEFAULT => -19,
		GOTOS => {
			'@2-3' => 59
		}
	},
	{#State 48
		ACTIONS => {
			'TUPLE' => 33,
			'MAPPING' => 32,
			'LIST' => 37,
			'TYPENAME' => 30,
			'IDENT' => 36,
			'STRUCTURE' => 34
		},
		GOTOS => {
			'structure' => 28,
			'list' => 29,
			'mapping' => 31,
			'tuple' => 38,
			'type' => 60
		}
	},
	{#State 49
		ACTIONS => {
			'IDENT' => -39
		},
		DEFAULT => -21,
		GOTOS => {
			'@3-3' => 61
		}
	},
	{#State 50
		ACTIONS => {
			'IDENT' => 62
		}
	},
	{#State 51
		ACTIONS => {
			";" => 63
		}
	},
	{#State 52
		ACTIONS => {
			'IDENT' => 64
		},
		DEFAULT => -50
	},
	{#State 53
		ACTIONS => {
			"," => 65
		}
	},
	{#State 54
		DEFAULT => -48
	},
	{#State 55
		ACTIONS => {
			"," => 66,
			">" => 67
		}
	},
	{#State 56
		DEFAULT => -42
	},
	{#State 57
		ACTIONS => {
			"}" => 69,
			'STRUCTURE' => 34,
			'TYPENAME' => 30,
			'IDENT' => 36,
			'MAPPING' => 32,
			'TUPLE' => 33,
			'LIST' => 37
		},
		GOTOS => {
			'tuple' => 38,
			'type' => 58,
			'mapping' => 31,
			'struct_item' => 68,
			'list' => 29,
			'structure' => 28
		}
	},
	{#State 58
		ACTIONS => {
			'IDENT' => 70
		}
	},
	{#State 59
		ACTIONS => {
			";" => 71
		}
	},
	{#State 60
		ACTIONS => {
			">" => 72
		}
	},
	{#State 61
		ACTIONS => {
			"(" => 73
		}
	},
	{#State 62
		DEFAULT => -23,
		GOTOS => {
			'@4-4' => 74
		}
	},
	{#State 63
		DEFAULT => -16
	},
	{#State 64
		DEFAULT => -51
	},
	{#State 65
		ACTIONS => {
			'STRUCTURE' => 34,
			'IDENT' => 36,
			'TYPENAME' => 30,
			'LIST' => 37,
			'MAPPING' => 32,
			'TUPLE' => 33
		},
		GOTOS => {
			'tuple' => 38,
			'type' => 52,
			'structure' => 28,
			'list' => 29,
			'tuple_type' => 75,
			'mapping' => 31
		}
	},
	{#State 66
		ACTIONS => {
			'LIST' => 37,
			'MAPPING' => 32,
			'TUPLE' => 33,
			'IDENT' => 36,
			'TYPENAME' => 30,
			'STRUCTURE' => 34
		},
		GOTOS => {
			'tuple' => 38,
			'type' => 52,
			'list' => 29,
			'tuple_type' => 76,
			'structure' => 28,
			'mapping' => 31
		}
	},
	{#State 67
		DEFAULT => -47
	},
	{#State 68
		DEFAULT => -43
	},
	{#State 69
		DEFAULT => -41
	},
	{#State 70
		ACTIONS => {
			'NULLABLE' => 77,
			";" => 78
		}
	},
	{#State 71
		DEFAULT => -20
	},
	{#State 72
		DEFAULT => -46
	},
	{#State 73
		ACTIONS => {
			'IDENT' => 36,
			'LIST' => 37,
			'TYPENAME' => 30,
			'TUPLE' => 33,
			'MAPPING' => 32,
			'STRUCTURE' => 34
		},
		DEFAULT => -29,
		GOTOS => {
			'tuple' => 38,
			'type' => 81,
			'funcdef_params' => 79,
			'funcdef_param' => 80,
			'mapping' => 31,
			'list' => 29,
			'structure' => 28
		}
	},
	{#State 74
		ACTIONS => {
			"(" => 82
		}
	},
	{#State 75
		ACTIONS => {
			">" => 83
		}
	},
	{#State 76
		DEFAULT => -49
	},
	{#State 77
		ACTIONS => {
			";" => 84
		}
	},
	{#State 78
		DEFAULT => -44
	},
	{#State 79
		ACTIONS => {
			")" => 86,
			"," => 85
		}
	},
	{#State 80
		DEFAULT => -30
	},
	{#State 81
		ACTIONS => {
			'IDENT' => 87
		},
		DEFAULT => -33
	},
	{#State 82
		ACTIONS => {
			'IDENT' => 36,
			'LIST' => 37,
			'STRUCTURE' => 34,
			'TYPENAME' => 30,
			'MAPPING' => 32,
			'TUPLE' => 33
		},
		DEFAULT => -29,
		GOTOS => {
			'funcdef_params' => 88,
			'tuple' => 38,
			'type' => 81,
			'structure' => 28,
			'list' => 29,
			'funcdef_param' => 80,
			'mapping' => 31
		}
	},
	{#State 83
		DEFAULT => -40
	},
	{#State 84
		DEFAULT => -45
	},
	{#State 85
		ACTIONS => {
			'IDENT' => 36,
			'TYPENAME' => 30,
			'LIST' => 37,
			'MAPPING' => 32,
			'TUPLE' => 33,
			'STRUCTURE' => 34
		},
		GOTOS => {
			'mapping' => 31,
			'funcdef_param' => 89,
			'structure' => 28,
			'list' => 29,
			'type' => 81,
			'tuple' => 38
		}
	},
	{#State 86
		ACTIONS => {
			'RETURNS' => 90
		}
	},
	{#State 87
		DEFAULT => -32
	},
	{#State 88
		ACTIONS => {
			")" => 91,
			"," => 85
		}
	},
	{#State 89
		DEFAULT => -31
	},
	{#State 90
		ACTIONS => {
			"(" => 92
		}
	},
	{#State 91
		ACTIONS => {
			'AUTHENTICATION' => 19
		},
		DEFAULT => -25,
		GOTOS => {
			'auth_type' => 93,
			'auth_param' => 94
		}
	},
	{#State 92
		ACTIONS => {
			'IDENT' => 36,
			'LIST' => 37,
			'STRUCTURE' => 34,
			'TYPENAME' => 30,
			'MAPPING' => 32,
			'TUPLE' => 33
		},
		DEFAULT => -29,
		GOTOS => {
			'funcdef_params' => 95,
			'type' => 81,
			'tuple' => 38,
			'structure' => 28,
			'list' => 29,
			'mapping' => 31,
			'funcdef_param' => 80
		}
	},
	{#State 93
		DEFAULT => -26
	},
	{#State 94
		ACTIONS => {
			";" => 96
		}
	},
	{#State 95
		ACTIONS => {
			")" => 97,
			"," => 85
		}
	},
	{#State 96
		DEFAULT => -24
	},
	{#State 97
		ACTIONS => {
			'AUTHENTICATION' => 19
		},
		DEFAULT => -25,
		GOTOS => {
			'auth_type' => 93,
			'auth_param' => 98
		}
	},
	{#State 98
		ACTIONS => {
			";" => 99
		}
	},
	{#State 99
		DEFAULT => -22
	}
],
                                  yyrules  =>
[
	[#Rule 0
		 '$start', 2, undef
	],
	[#Rule 1
		 'start', 1, undef
	],
	[#Rule 2
		 'module_list', 0,
sub
#line 122 "typedoc.yp"
{ [] }
	],
	[#Rule 3
		 'module_list', 2,
sub
#line 123 "typedoc.yp"
{ [ @{$_[1]}, $_[2] ] }
	],
	[#Rule 4
		 '@1-2', 0,
sub
#line 126 "typedoc.yp"
{ $_[0]->get_comment() }
	],
	[#Rule 5
		 'module', 8,
sub
#line 126 "typedoc.yp"
{
    Bio::KBase::KIDL::KBT::DefineModule->new(options => $_[1],
			   @{$_[4]},
			   module_components => $_[6],
		           comment => $_[3]);
    }
	],
	[#Rule 6
		 'mod_name_def', 1,
sub
#line 134 "typedoc.yp"
{ [ module_name => $_[1], service_name => $_[1] ] }
	],
	[#Rule 7
		 'mod_name_def', 3,
sub
#line 135 "typedoc.yp"
{ [ module_name => $_[3], service_name => $_[1] ] }
	],
	[#Rule 8
		 'module_opts', 0,
sub
#line 138 "typedoc.yp"
{ [] }
	],
	[#Rule 9
		 'module_opts', 2,
sub
#line 139 "typedoc.yp"
{ [ @{$_[1]}, $_[2] ] }
	],
	[#Rule 10
		 'module_components', 0,
sub
#line 142 "typedoc.yp"
{ [] }
	],
	[#Rule 11
		 'module_components', 2,
sub
#line 143 "typedoc.yp"
{ [ @{$_[1]}, $_[2] ] }
	],
	[#Rule 12
		 'module_component_with_doc', 1, undef
	],
	[#Rule 13
		 'module_component_with_doc', 2,
sub
#line 148 "typedoc.yp"
{ $_[2]->comment($_[1]); $_[2] }
	],
	[#Rule 14
		 'module_component', 1, undef
	],
	[#Rule 15
		 'module_component', 1, undef
	],
	[#Rule 16
		 'module_component', 4, undef
	],
	[#Rule 17
		 'module_component', 2,
sub
#line 155 "typedoc.yp"
{ $auth_default = $_[1]; 'auth_default' . $_[1] }
	],
	[#Rule 18
		 'auth_type', 2,
sub
#line 158 "typedoc.yp"
{ 
			       if ($valid_authentication_value{$_[2]}) 
			       {
				   $_[2];
			       }
			       else
			       {
				   $_[0]->emit_error("Invalid authentication type '" . $_[2] . "'. Valid types are " . join(" ", map { "'$_'" } @valid_authentication_values));
				   "none";
			       }
			   }
	],
	[#Rule 19
		 '@2-3', 0,
sub
#line 179 "typedoc.yp"
{ $_[0]->get_comment() }
	],
	[#Rule 20
		 'typedef', 5,
sub
#line 179 "typedoc.yp"
{ $_[0]->define_type($_[2], $_[3], $_[4]); }
	],
	[#Rule 21
		 '@3-3', 0,
sub
#line 182 "typedoc.yp"
{ $_[0]->get_comment() }
	],
	[#Rule 22
		 'funcdef', 13,
sub
#line 183 "typedoc.yp"
{ Bio::KBase::KIDL::KBT::Funcdef->new(return_type => $_[10], name => $_[3], parameters => $_[6],
			      comment => $_[4], async => $_[1], authentication => $_[12] ); }
	],
	[#Rule 23
		 '@4-4', 0,
sub
#line 185 "typedoc.yp"
{ $_[0]->get_comment() }
	],
	[#Rule 24
		 'funcdef', 10,
sub
#line 186 "typedoc.yp"
{ Bio::KBase::KIDL::KBT::Funcdef->new(return_type => [$_[3]], name => $_[4], parameters => $_[7],
			      comment => $_[5], async => $_[1], authentication => $_[9]); }
	],
	[#Rule 25
		 'auth_param', 0,
sub
#line 190 "typedoc.yp"
{ $auth_default }
	],
	[#Rule 26
		 'auth_param', 1, undef
	],
	[#Rule 27
		 'async_flag', 0,
sub
#line 194 "typedoc.yp"
{ 0 }
	],
	[#Rule 28
		 'async_flag', 1,
sub
#line 195 "typedoc.yp"
{ 1 }
	],
	[#Rule 29
		 'funcdef_params', 0,
sub
#line 198 "typedoc.yp"
{ [] }
	],
	[#Rule 30
		 'funcdef_params', 1,
sub
#line 199 "typedoc.yp"
{ [ $_[1] ] }
	],
	[#Rule 31
		 'funcdef_params', 3,
sub
#line 200 "typedoc.yp"
{ [ @{$_[1]}, $_[3] ] }
	],
	[#Rule 32
		 'funcdef_param', 2,
sub
#line 203 "typedoc.yp"
{ { type => $_[1], name => $_[2] } }
	],
	[#Rule 33
		 'funcdef_param', 1,
sub
#line 204 "typedoc.yp"
{ { type => $_[1] } }
	],
	[#Rule 34
		 'type', 1, undef
	],
	[#Rule 35
		 'type', 1, undef
	],
	[#Rule 36
		 'type', 1, undef
	],
	[#Rule 37
		 'type', 1, undef
	],
	[#Rule 38
		 'type', 1, undef
	],
	[#Rule 39
		 'type', 1,
sub
#line 213 "typedoc.yp"
{ my $type = $_[0]->lookup_type($_[1]);
			if (!defined($type))
			{
			    $_[0]->emit_error("Attempt to use undefined type '$_[1]'");
			}
			$type }
	],
	[#Rule 40
		 'mapping', 6,
sub
#line 221 "typedoc.yp"
{ Bio::KBase::KIDL::KBT::Mapping->new(key_type => $_[3]->[0], value_type=> $_[5]->[0]); }
	],
	[#Rule 41
		 'structure', 4,
sub
#line 224 "typedoc.yp"
{ Bio::KBase::KIDL::KBT::Struct->new(items => $_[3]); }
	],
	[#Rule 42
		 'struct_items', 1,
sub
#line 227 "typedoc.yp"
{ [$_[1]] }
	],
	[#Rule 43
		 'struct_items', 2,
sub
#line 228 "typedoc.yp"
{ [ @{$_[1]}, $_[2] ] }
	],
	[#Rule 44
		 'struct_item', 3,
sub
#line 231 "typedoc.yp"
{ Bio::KBase::KIDL::KBT::StructItem->new(item_type => $_[1], name => $_[2], nullable => 0); }
	],
	[#Rule 45
		 'struct_item', 4,
sub
#line 232 "typedoc.yp"
{ Bio::KBase::KIDL::KBT::StructItem->new(item_type => $_[1], name => $_[2], nullable => 1); }
	],
	[#Rule 46
		 'list', 4,
sub
#line 235 "typedoc.yp"
{ Bio::KBase::KIDL::KBT::List->new(element_type => $_[3]); }
	],
	[#Rule 47
		 'tuple', 4,
sub
#line 238 "typedoc.yp"
{ Bio::KBase::KIDL::KBT::Tuple->new(element_types => [ map { $_->[0] } @{$_[3]}],
							    element_names => [ map { $_->[1] } @{$_[3]}] ); }
	],
	[#Rule 48
		 'tuple_types', 1,
sub
#line 242 "typedoc.yp"
{ [ $_[1] ] }
	],
	[#Rule 49
		 'tuple_types', 3,
sub
#line 243 "typedoc.yp"
{ [ @{$_[1]}, $_[3] ] }
	],
	[#Rule 50
		 'tuple_type', 1,
sub
#line 246 "typedoc.yp"
{ [ $_[1], undef ] }
	],
	[#Rule 51
		 'tuple_type', 2,
sub
#line 247 "typedoc.yp"
{ [ $_[1], $_[2] ] }
	]
],
                                  @_);
    bless($self,$class);
}

#line 250 "typedoc.yp"
 

sub define_type
{
    my($self, $old_type, $new_type, $comment) = @_;
    my $def = Bio::KBase::KIDL::KBT::Typedef->new(name => $new_type, alias_type => $old_type, comment => $comment);
    push(@{$self->YYData->{type_list}}, $def);
    $self->YYData->{type_table}->{$new_type} = $def;
    #
    # Try to name the typedefed type if it is a tuple or struct.
    #
    if ($old_type->isa('Bio::KBase::KIDL::KBT::Struct') || $old_type->isa('Bio::KBase::KIDL::KBT::Tuple'))
    {
	$old_type->name_type($new_type);
	if ($comment)
	{
	    $old_type->comment($comment);
	}
    }
    return $def;
}

sub types
{
    my($self) = @_;
    return $self->YYData->{type_list} || [];
}

sub lookup_type
{
    my($self, $name) = @_;
    return $self->YYData->{type_table}->{$name};
}


sub parse
{
    my($self, $data, $filename) = @_;

    $self->init_state($data, $filename);
    my $res = $self->YYParse(yylex => \&Lexer, yyerror => \&Error);

    return ($res, $self->YYData->{error_count});;
}

sub init_state
{
    my($self, $data, $filename) = @_;

    #
    # Initialize type table to just the builtins.
    #
    $self->YYData->{type_table} = { %builtin_types };
    $self->YYData->{INPUT} = $data;
    $self->YYData->{line_number} = 1;
    $self->YYData->{filename} = $filename;
    $self->YYData->{error_count} = 0;
}


sub Error {
    my($parser) = @_;
    
    my $data = $parser->YYData;

    my $error = $data->{ERRMSG} || "Syntax error";

    $parser->emit_error($error);
}

sub emit_error {
    my($parser, $message) = @_;
    
    my $data = $parser->YYData;

    my $line = $data->{line_number};
    my $file = $data->{filename};

    my $token = $parser->YYCurtok;
    my $tval = $parser->YYCurval;

    if ($token eq 'IDENT')
    {
	$token = $tval;
    }
    

    print STDERR "$file:$line: $message (next token is '$token')\n";
    $data->{error_count}++;
}

sub emit_warning {
    my($parser, $message) = @_;
    
    my $data = $parser->YYData;

    my $line = $data->{line_number};
    my $file = $data->{filename};

    my $token = $parser->YYCurtok;
    my $tval = $parser->YYCurval;

    if ($token eq 'IDENT')
    {
	$token = $tval;
    }
    my $twarn = $token ? " next token is '$token'" : "";

    warn "Warning: $file:$line: $message$twarn\n";
}


sub Lexer {
    my($parser)=shift;

    my $data = $parser->YYData;
    my $bufptr = \$data->{INPUT};

    for ($$bufptr)
    {
	while ($_ ne '')
	{
	    # print "Top: '$_'\n";
	    next if (s/^[ \t]+//);
	    if (s/^\n//)
	    {
		$data->{line_number}++;
		next;
	    }
	    
	    if ($_ eq '')
	    {
		return ('', undef);
	    }
	    elsif (s/^([A-Za-z][A-Za-z0-9_]*)//)
	    {
		my $str = $1;
		if ($builtin_types{$str})
		{
		    my $type = $data->{type_table}->{$str};
		    return('TYPENAME', $type);
		}
		elsif ($kidl_keywords{$str})
		{
		    return(uc($str), $str);
		}
		elsif ($kidl_reserved{$str})
		{
		    $parser->emit_warning("Use of reserved word '$str'");
		    return('IDENT', $str);
		}
		else
		{
		    return('IDENT', $str);
		}
	    }
	    elsif (s,^/\*(.*?)\*/,,s)
	    {
		my $com = $1;
		if ($com =~ /^\*/)
		{
		    #
		    # It was a /** comment which is a doc-block. Return that as a token.
		    #
		    return('DOC_COMMENT', $com);
		}

		my @lines = split(/\n/, $com);
		$data->{line_number} += @lines - 1;
		$lines[0] =~ s/^\s*//;
		my @new = ($lines[0]);
		shift @lines;
		if (@lines)
		{
		    my $l = $lines[0];
		    $l =~ s/\t/        /g;
		    my($init_ws) = $l =~ /^(\s+)/;
		    my $x = length($init_ws);
		    # print "x=$x '$lines[0]'\n";
		    for my $l (@lines)
		    {
			$l =~ s/\t/        /g;
			$l =~ s/^\s$x//;
			push(@new, $l);
		    }
		}
		#$parser->{cur_comment} = $com;
		$parser->{cur_comment} = join("\n", @new);
		
		# Else just elide.
	    }
	    elsif (s/^(.)//s)
	    {
		return($1,$1);
	    }
	}
    }
}

#
# Return the current comment if there is one. Always
# clear the current comment.
#
sub get_comment
{
    my($self) = @_;
    my $ret = $self->{cur_comment};
    $self->{cur_comment} = "";
    $ret =~ s/^\s+//;
    $ret =~ s/\s+$//;
    return $ret;
}
    

1;
