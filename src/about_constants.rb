require File.expand_path(File.dirname(__FILE__) + '/neo')

C = 'top level'

class AboutConstants < Neo::Koan
  C = 'nested'

  def test_nested_constants_may_also_be_referenced_with_relative_paths
    assert_equal 'nested', C
  end

  def test_top_level_constants_are_referenced_by_double_colons
    assert_equal 'top level', ::C
  end

  def test_nested_constants_are_referenced_by_their_complete_path
    assert_equal 'nested', AboutConstants::C
    assert_equal 'nested', ::AboutConstants::C
  end

  # ------------------------------------------------------------------

  class Animal
    LEGS = 4
    def legs_in_animal
      LEGS
    end

    class NestedAnimal
      def legs_in_nested_animal
        LEGS
      end
    end
  end

  def test_nested_classes_inherit_constants_from_enclosing_classes
    assert_equal 4, Animal::NestedAnimal.new.legs_in_nested_animal
  end

  # ------------------------------------------------------------------

  class Reptile < Animal
    def legs_in_reptile
      LEGS
    end
  end

  def test_subclasses_inherit_constants_from_parent_classes
    assert_equal 4, Reptile.new.legs_in_reptile
  end

  # ------------------------------------------------------------------

  class MyAnimals
    LEGS = 2

    class Bird < Animal
      # p Module.nesting
      # [AboutConstants::MyAnimals::Bird, AboutConstants::MyAnimals, AboutConstants]
      def legs_in_bird
        LEGS
      end
    end
  end

  def test_who_wins_with_both_nested_and_inherited_constants
    assert_equal 2, MyAnimals::Bird.new.legs_in_bird # nested wins over inherited
  end

  # QUESTION: Which has precedence: The constant in the lexical scope,
  # or the constant from the inheritance hierarchy?
  # The constant in the lexical scope has precedence.
  # Ruby searches for the constant definition in this order:
  # 1. The enclosing scope (in this case, MyAnimals, which has LEGS = 2)
  # 2. Any outer scopes (up to but not including the top level)
  # 3. Included modules
  # 4. Superclass(es)
  # 5. Top level or global
  # 6. Object
  # 7. Kernel

  # ------------------------------------------------------------------

  class MyAnimals::Oyster < Animal
    # p Module.nesting
    # [AboutConstants::MyAnimals::Oyster, AboutConstants]
    def legs_in_oyster
      LEGS
    end
  end

  def test_who_wins_with_explicit_scoping_on_class_definition
    assert_equal 4, MyAnimals::Oyster.new.legs_in_oyster
  end

  # QUESTION: Now which has precedence: The constant in the lexical
  # scope, or the constant from the inheritance hierarchy?  Why is it
  # different than the previous answer?
  # Ruby searches for the constant definition in this order:
  # 1. The enclosing scope (in this case, AboutConstants, which do not have the constant LEGS)
  # 2. Any outer scopes (up to but not including the top level)
  # 3. Included modules
  # 4. Superclass(es) (in this case, Animal, which has LEGS = 4)
  # 5. Top level or global
  # 6. Object
  # 7. Kernel
end
