#Definition for a binary tree node.

defmodule TreeNode do
  @type t :: %__MODULE__{
          val: integer,
          left: TreeNode.t() | nil,
          right: TreeNode.t() | nil
        }
  defstruct val: 0, left: nil, right: nil
end

defmodule Solution do
  @spec has_path_sum(root :: TreeNode.t | nil, target_sum :: integer) :: boolean
  def has_path_sum(root, target_sum) when root.left != %TreeNode{} and root.right != %TreeNode{} do

    target_sum = target_sum - root.val
    Solution.has_path_sum(root.left, target_sum) || Solution.has_path_sum(root.right, target_sum)

  end

  def has_path_sum(root, target) when root == %TreeNode{} do
    false
    #IO.puts("zero")
  end

  def has_path_sum(root, target) when root.left == %TreeNode{} and root.right == %TreeNode{} and target - root.val == 0 do
    #IO.puts("true")
    true
  end

  def has_path_sum(root, target) when root.left == %TreeNode{} and root.right == %TreeNode{} and target - root.val != 0 do
    #IO.puts("false")
    false
  end

  def has_path_sum(root, target) when root.left == %TreeNode{} and root.right != %TreeNode{} do
    target = target - root.val
    Solution.has_path_sum(root.right, target)
  end

  def has_path_sum(root, target) when root.left != %TreeNode{} and root.right == %TreeNode{} do
    target = target - root.val
    Solution.has_path_sum(root.left, target)
  end

end


root = %TreeNode{val: 5, left: %TreeNode{val: 4, left: %TreeNode{val: 11, left: %TreeNode{val: 7, left: %TreeNode{}, right: %TreeNode{}}, right: %TreeNode{val: 2, left: %TreeNode{}, right: %TreeNode{}}}, right: %TreeNode{}}, right: %TreeNode{val: 8, left: %TreeNode{val: 13, left: %TreeNode{}, right: %TreeNode{}}, right: %TreeNode{val: 4, left: %TreeNode{}, right: %TreeNode{val: 1, left: %TreeNode{}, right: %TreeNode{}}}}}

summ = 18

a = Solution.has_path_sum(root, summ)

IO.puts(a)
