/********************************************************************
	created:	2006/11/15
	author:		kuiwu
	
	purpose:	
	Copyright (C) 2006 - All Rights Reserved
*********************************************************************/

#pragma once

#include <vector.h>
using namespace abase;
#include <A3DTypes.h>

class AFile;


namespace AutoMove
{



#define GRP_MAXINT (1<<30)


typedef union { double fval; long lval; } labelValue;

class CGGraph;
class CGNode;
class CGEdge;

/*generic graph  */

class CGGraph  
{
public:
	CGGraph();
	~CGGraph();  //non-virtual
	CGNode * GetNode(int num) const
	{
		 if (num >=0 && num < (int)m_Nodes.size()) 
			 return m_Nodes[num];
		 else
			 return NULL;
	}

  int AddNode(CGNode * n);
  CGNode * RemoveNode(CGNode * n, int& oldid);
  void AddEdge(CGEdge * e);
  void RemoveEdge(CGEdge *e);
  

  void Release();

  CGGraph * Clone() const;

  vector<CGNode*>* GetAllNodes()
  {
	  return &m_Nodes;
  }

  vector<CGEdge*>* GetAllEdges()
  {
	  return &m_Edges;
  }

  
  //different app,  different need
  //let app do  "save or load"
  //void Save(AFile& fileimg);
  //void Load(AFileImage& fileimg);
  
private:
	vector<CGNode*> m_Nodes;
	vector<CGEdge*> m_Edges;
	

};

/* generic graph edge     */
class CGEdge
{
public:
	enum 
	{
		kEdgeWeight = 0,  //double 
	};

	CGEdge(unsigned int from, unsigned int to, double weight);

	void SetLabelF(unsigned int index, double val);
	unsigned int GetFrom() { return m_From; }
	unsigned int GetTo() { return m_To; }
	unsigned int GetNum() {return m_EdgeNum;}

	inline double GetLabelF(unsigned int index) const 
	{ 
		if (index < m_Labels.size()) return m_Labels[index].fval; 
		return GRP_MAXINT; 
	}
	inline long GetLabelL(unsigned int index) const 
	{ 
		if (index < m_Labels.size()) return m_Labels[index].lval; 
		return GRP_MAXINT; 
	}

	double GetWeight() { return GetLabelF(kEdgeWeight); }
	void SetWeight(double val) { SetLabelF(kEdgeWeight, val); }


	// clone moderately
	CGEdge * ModerateClone()
	{
		return new CGEdge(m_From, m_To, GetWeight());
	}
protected:
private:
	friend class CGGraph;
	unsigned int m_From, m_To;
	unsigned int m_EdgeNum;  //the edge index in the graph

	vector<labelValue> m_Labels;
};



/* generic graph node     */

class CGNode
{
public:
	/** Definitions for node labels */
	enum 
	{
	  kLayer  = 0, // the layer we lie; this is a LONG label
	  kXCoordinate, // map coordinate; this is a LONG label
	  kZCoordinate,	// this is a LONG label
	  kTemporaryLabel , // for any temporary usage; this label can be LONG or FLOATING point
	  kNumLabels,
	};

	CGNode();
	
  // set/get various labels for each node
  void SetLabelF(unsigned int index, double val);
  void SetLabelL(unsigned int index, long val);



  inline double GetLabelF(unsigned int index) const
  {
    if (index < m_Labels.size()) 
		return m_Labels[index].fval; 
	else
		return GRP_MAXINT;
  }
  inline long GetLabelL(unsigned int index) const
  {
    if (index < m_Labels.size()) 
		return m_Labels[index].lval; 
	else
		return GRP_MAXINT;
  }


  void SetMapCoord(const A3DPOINT2& pt)
  {
	  SetMapCoord(pt.x, pt.y);
  }

  void SetMapCoord(int x, int z)
  {
	  SetLabelL(kXCoordinate, x);
	  SetLabelL(kZCoordinate, z);
  }

  A3DPOINT2 GetMapCoord() const
  {
	  return A3DPOINT2(GetLabelL(kXCoordinate), GetLabelL(kZCoordinate));
  }

  unsigned int GetNum()const 
  {
	  return m_NodeNum;
  }

  void AddEdge(CGEdge * e);
  void RemoveEdge(CGEdge *e);

  // clone moderately, only labels
  CGNode * ModerateClone();

  // set/get marked edge for each node (limit 1)
  void MarkEdge(CGEdge *e) { m_MarkedEdge = e; }
  CGEdge *GetMarkedEdge() { return m_MarkedEdge; }



  // chooses which label will be used as the key for
  // priority queue
  void SetKeyLabel(int which) { m_KeyLabel = which; }
  double GetKey() { return m_Labels[m_KeyLabel].fval; }

  vector<CGEdge*>* GetAllEdges()
  {
	  return &m_AllEdges;
  }

  unsigned int key; // for use by a data structure to maintain a reverse-lookup
					// to go from an object to a table key in constant time.
protected:
private:
  friend class CGGraph;
  unsigned int m_NodeNum;  // the node index in the graph
  vector<labelValue> m_Labels;
  CGEdge * m_MarkedEdge;
//  vector<CGEdge *> m_EdgesOutgoing;
//  vector<CGEdge *> m_EdgesIncoming;
  vector<CGEdge *> m_AllEdges;
  int	m_KeyLabel;
  
};

}