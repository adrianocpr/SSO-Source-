#ifndef _ANIMATOR_LISTENER_H_
#define _ANIMATOR_LISTENER_H_

class CAnimator;

class CAnimatorListener
{
    public:
        CAnimatorListener() {}
        virtual ~CAnimatorListener() {}
        virtual void OnPlayAnimation(CAnimator *animator) {}
        virtual void OnStopAnimation(CAnimator *animator) {}
        virtual void OnStartAnimationQTE(CAnimator *animator, const unsigned int uiQTEID) {}
        virtual void OnEndAnimationQTE(CAnimator *animator, const unsigned int uiQTEID) {}
};

#endif
