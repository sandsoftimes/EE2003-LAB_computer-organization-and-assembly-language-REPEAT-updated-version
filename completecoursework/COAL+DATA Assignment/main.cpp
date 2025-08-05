#include <iostream>


using namespace std;


struct TreeNode
    {

        int data;
        TreeNode *left , *right;

    };

struct node 
            {
                int data;
                node * left;
                node * right;
            };
class AVL
    {
        public:
		
		int A1[10] = {0,0,0,0,0,0,0,0,0,0};
        TreeNode * root;
        int count;
        AVL()
            {

                root = NULL;
				count = 0;
            }

    TreeNode * find_parent(TreeNode *  temp , int key)
        {
            if (temp->data == root->data)
                {
                    return temp;
                }
            if (temp->left != NULL)
            if (temp->left->data == key)
                {
                   return temp;
                }
            if(temp->right != NULL)
            if (temp->right->data == key)
                {
                    return temp;
                }
            else if (temp->data > key)
                {
                   return find_parent(temp->left ,key);

                }
            else if (temp->data < key)
                {
                 return find_parent(temp->right , key);
                }
            
            
        }

    void insert(TreeNode * & temp , int key)   
    {

        int balance{};
        
        TreeNode * temp1 , * temp2 , *temp3;
        if (root== NULL)
            {
                root = new TreeNode;
                root->data = key;

                root->left = NULL;
                root->right = NULL;    
                return;
            }
        
        if(temp == NULL)
            {
                temp = new TreeNode;
                temp->data = key;
                temp->left = NULL;
                temp->right = NULL;
            }

        else if (key == temp->data)
            {
                cout << "no dup" << endl;
            }
        else if (key < temp->data)
            {

             insert(temp->left , key );

            }

        else if (key > temp->data)
            {
                insert(temp->right , key);
            }
        
        balance = getBalanceFactor(temp);
       temp2 = temp;
        { 
        if (balance < -1 && temp2->right != NULL && temp2->right->right != NULL)
            {
                
                temp3 = find_parent(root, temp2->data);
                
                if (temp3->right->data == temp2->data || root == temp3)
                {
                    if (temp3 == root)
                        {
                            root = temp2->right;
                            temp2->right->left = temp2;
                        }
                    else{    
                
                temp3->right = temp2->right;
                temp3->right->left = temp2;
                temp2->right = NULL;
                    }

                }
                else if (temp3->left->data == temp->data)
                    {
                       
                        temp3->left = temp2->right;
                        temp3->left->left = temp2;
                        temp2->right = NULL;
                    }

            }
        else if (balance > 1 && temp2->left != NULL && temp2->left->left != NULL )
            {
                temp3 = find_parent(root, temp2->data);
                if (temp3->left->data == temp2->data || root == temp3)
                {
                    
                     if (root == temp)
                        {
                            root = temp2->left;
                            temp2->left->right = temp2;
                        }
                else
                    { 
          
                temp3->right = temp2->left;
                temp3->right->right = temp2;
                temp2->left = NULL;
                    }
                }
                else if (temp3->right->data == temp2->data)
                    {
                    
                    temp3->left = temp2->left;
                    temp3->left->right = temp2;
                    temp2->left = NULL;
                    }
            }
        else if (balance > 1 && temp2->left != NULL && temp2->left->right != NULL)
            {

                temp3 = find_parent(root, temp2->data);
                if (temp3->left->data == temp2->data || temp3 == root)
                    {
                        
                        if (temp3 == root)
                            {

                                root = temp3->left->right;
                                temp3->left->right->left = temp3->left;
                                temp3->left->right->right = temp3;
                            }
                        else
                            {
                        
                        temp3->right = temp2->left->right;
                        temp3->right->left = temp2->left;
                        temp3->right->right = temp2;
                        temp2->left = NULL;
                            }
                    }
                else if (temp3->right->data == temp2->data)
                    {
                       
                       temp3->left = temp2->left->right;
                       temp3->left->left = temp2->left;
                       temp3->right->right = temp2;
                       temp2->left = NULL;

                    }
            }
        else if (balance < -1 && temp2->right != NULL && temp2->right->left != NULL)
            {
                temp3 = find_parent(root, temp2->data);
                if (temp3->right->data == temp2->data || temp3 == root)
                    {
                        if (temp3 == root)
                            {
                                root = temp3->right->left;
                                temp3->right->left->right = temp3->right;
                                temp3->right->left->left = temp3;
                            }
                        else
                        {
                        
                        temp3->right = temp2->right->left;
                        temp3->right->right = temp2->left;
                        temp3->right->left = temp2;
                        temp2->right = NULL;
                        }
                    }
                else if (temp3->left->data == temp->data)
                    {
                        
                        temp3->left = temp2->right->left;
                        temp3->left->right = temp2->left;
                        temp3->left->left = temp2;
                        temp2->right = NULL;

                    }

                

            }
        }
    }


  
    int getBalanceFactor(TreeNode * n) {
    if (n == NULL)
      return 0;
    return height(n -> left) - height(n -> right);
  }
  
    int height(TreeNode * r) {
    if (r == NULL)
      return 0;
    else {
     
      int lheight = height(r -> left);
      int rheight = height(r -> right);

     
      if (lheight > rheight)
        return (lheight + 1);
      else return (rheight + 1);
    }
  }

  void traverse(TreeNode * temp)
    {
        cout << temp->data << endl;
        if (temp->left != NULL)
            {
                traverse(temp->left);   
            }
        

        if(temp->right != NULL)
            {
                traverse(temp->right);
            }

    }
    
    TreeNode * bst_t (node * bst_head)
		{
		
			 A1[count] = bst_head->data;
			 count++;
        if (bst_head->left != NULL)
            {
                bst_t(bst_head->left);   
            }
        

        if(bst_head->right != NULL)
            {
                bst_t(bst_head->right);
            }
			
		}    
    void  convertbsttoavl(node * bst_head)
		{
			count = 0;
			bst_t(bst_head);
			
			for(int i = 0 ; i < count ; i++)
				{
					
					insert(root,A1[i]);
				}
			
			
		}
    };


    


class tree 
    {

    
        public:
            node *root  , *temp1 , *temp2;
            int hold;
            tree()
            {

                root = temp1 = temp2 =  NULL;
            }

            
		void insert(int key , node *&temp)
			{
				
				if(temp == NULL)
					{
						
						temp = new node;
						temp->data = key;
						temp->left = temp->right = NULL;
						
						return;
					}
				if (key == temp->data)
					
					{
						return;
					}
				if(temp->data > key)
					{
						insert(key , temp->left);
					}
				if(temp->data < key)
					{
						insert(key , temp->right);
						
					}
			}
			
	};
	
	
int main()
    {
        AVL A1;
        tree B1;
        B1.insert(6,B1.root);
        B1.insert(8,B1.root);
        B1.insert(9,B1.root);
        cout << "before change" << endl;
               
    cout << B1.root->data << endl;
        cout << B1.root->right->data << endl;
        cout << B1.root->right->right->data << endl;
        cout << "after change" << endl;
    
        A1.convertbsttoavl(B1.root);
        
    cout << A1.root->data << endl;
        cout << A1.root->right->data << endl;
        cout << A1.root->left->data << endl;
        
    }